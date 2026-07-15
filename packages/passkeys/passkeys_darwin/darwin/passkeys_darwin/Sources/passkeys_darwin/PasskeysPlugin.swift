import AuthenticationServices
import LocalAuthentication
import Foundation
import Combine

#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

protocol Cancellable {
    func cancel()
}

@available(macOS 13.5, iOS 16.0, *)
public class PasskeysPlugin: NSObject, FlutterPlugin, PasskeysApi {
    var inFlightController: Cancellable?
    let lock = NSLock()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = PasskeysPlugin()
        // Workaround for https://github.com/flutter/flutter/issues/118103.
        #if os(iOS)
                let messenger = registrar.messenger()
        #else
                let messenger = registrar.messenger
        #endif
        PasskeysApiSetup.setUp(binaryMessenger: messenger, api: instance)
    }
    
    func canAuthenticate() throws -> Bool {
        return LocalAuth.shared.canAuthenticate()
    }
    
    func hasBiometrics() throws -> Bool {
        return LocalAuth.shared.hasBiometrics()
    }
    
    func getFacetID(completion: @escaping (Result<String, Error>) -> Void) {
        completion(.success(""))
    }
    
    func register(
        challenge: String,
        relyingParty: RelyingParty,
        user: User,
        excludeCredentials: [CredentialType],
        pubKeyCredValues: [Int64],
        canBePlatformAuthenticator: Bool = true,
        canBeSecurityKey: Bool = true,
        residentKeyPreference: String?,
        attestationPreference: String?,
        salt: String?,
        completion: @escaping (Result<RegisterResponse, Error>) -> Void
    ) {
        guard (try? canAuthenticate()) == true else {
            completion(.failure(CustomErrors.deviceNotSupported))
            return
        }
        
        guard let decodedChallenge = Data.fromBase64Url(challenge) else {
            completion(.failure(CustomErrors.decodingChallenge))
            return
        }

        guard let decodedUserId = Data.fromBase64Url(user.id) else {
            completion(.failure(CustomErrors.decodingChallenge))
            return
        }
        
        var requests: [ASAuthorizationRequest] = []
        let rp = relyingParty.id
        
        if(canBePlatformAuthenticator){
            // Create a platform (on‑device) registration request.
            let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: rp)
            let platformRequest = platformProvider.createCredentialRegistrationRequest(
                challenge: decodedChallenge,
                name: user.name,
                userID: decodedUserId
            )
            

            if #available(iOS 17.4, *) {
                let excluded = parseCredentials(credentials: excludeCredentials)
                platformRequest.excludedCredentials = excluded
            }

            // PRF
            if #available(iOS 18.0, *) {
                guard let salt = salt, let saltData = Data(hex: salt) else {
                return
            }
            let values = ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues(saltInput1: saltData)
                platformRequest.prf = ASAuthorizationPublicKeyCredentialPRFRegistrationInput.inputValues(values)
            }
            
            requests.append(platformRequest)
        }
        
        if(canBeSecurityKey){
            // Create an external (security key) registration request.
            let securityKeyProvider = ASAuthorizationSecurityKeyPublicKeyCredentialProvider(relyingPartyIdentifier: rp)
            let externalRequest = securityKeyProvider.createCredentialRegistrationRequest(
                challenge: decodedChallenge,
                displayName: user.name,   // displayName as provided by the new API
                name: user.name,
                userID: decodedUserId
            )

            switch residentKeyPreference {
            case .some("preferred"):
                externalRequest.residentKeyPreference = .preferred
            case .some("required"):
                externalRequest.residentKeyPreference = .required
            default:
                break
            }

            switch attestationPreference {
            case .some("none"):
                externalRequest.attestationPreference = .none
            case .some("indirect"):
                externalRequest.attestationPreference = .indirect
            case .some("direct"):
                externalRequest.attestationPreference = .direct
            default:
                break
            }
            
            
            if #available(iOS 17.4, *) {
                let excludedSecurityKeys = parseSecurityKeyCredentials(credentials: excludeCredentials)
                externalRequest.excludedCredentials = excludedSecurityKeys
            }
            
            externalRequest.credentialParameters = pubKeyCredValues.map { rawValue in
                let intValue = Int(rawValue)
                
                return ASAuthorizationPublicKeyCredentialParameters(
                    algorithm: ASCOSEAlgorithmIdentifier(rawValue: intValue)
                )
            }
            
            requests.append(externalRequest)
        }
        
        func wrappedCompletion(result: Result<RegisterResponse, Error>) {
            lock.unlock()
            completion(result)
        }
        
        let con = RegisterController(completion: wrappedCompletion)
        con.run(requests: requests)
        inFlightController = con
    }
    
    func authenticate(
        relyingPartyId: String,
        challenge: String,
        conditionalUI: Bool,
        allowedCredentials: [CredentialType],
        preferImmediatelyAvailableCredentials: Bool,
        salt: String?,
        completion: @escaping (Result<AuthenticateResponse, Error>) -> Void
    ) {
        guard (try? canAuthenticate()) == true else {
            completion(.failure(CustomErrors.deviceNotSupported))
            return
        }
        
        guard let decodedChallenge = Data.fromBase64Url(challenge) else {
            completion(.failure(CustomErrors.decodingChallenge))
            return
        }
        
        var requests: [ASAuthorizationRequest] = []
        
        let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: relyingPartyId)
        let platformRequest = platformProvider.createCredentialAssertionRequest(challenge: decodedChallenge)
        platformRequest.allowedCredentials = parseCredentials(credentials: allowedCredentials)
        
        // PRF
        if #available(iOS 18.0, *) {
            guard let salt = salt, let saltData = Data(hex: salt) else { return }
        let values = ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues(saltInput1: saltData)
            platformRequest.prf = ASAuthorizationPublicKeyCredentialPRFAssertionInput.inputValues(values)
        }
        
        requests.append(platformRequest)
        
        // We should not show the security key flow when preferImmediatelyAvailable is set to true
        // Also skip security key requests when using conditional UI, which doesn't support them
        if !preferImmediatelyAvailableCredentials && !conditionalUI {
            let securityKeyProvider = ASAuthorizationSecurityKeyPublicKeyCredentialProvider(relyingPartyIdentifier: relyingPartyId)
            let externalRequest = securityKeyProvider.createCredentialAssertionRequest(challenge: decodedChallenge)
            externalRequest.allowedCredentials = parseSecurityKeyCredentials(credentials: allowedCredentials)
            requests.append(externalRequest)
        }
        
        let con = AuthenticateController(completion: completion)
        con.run(requests: requests, conditionalUI: conditionalUI, preferImmediatelyAvailableCredentials: preferImmediatelyAvailableCredentials)
        inFlightController = con
    }
    
    func cancelCurrentAuthenticatorOperation(completion: @escaping (Result<Void, Error>) -> Void) {
        inFlightController?.cancel()
        completion(.success(()))
    }
    
    private func parseCredentials(credentials: [CredentialType]) -> [ASAuthorizationPlatformPublicKeyCredentialDescriptor] {
        return credentials.compactMap { credential in
            guard let credentialData = Data.fromBase64Url(credential.id) else {
                return nil
            }
            return ASAuthorizationPlatformPublicKeyCredentialDescriptor(credentialID: credentialData)
        }
    }
    
    private func parseSecurityKeyCredentials(credentials: [CredentialType]) -> [ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor] {
        return credentials.compactMap { credential in
            guard let credentialData = Data.fromBase64Url(credential.id) else {
                return nil
            }
            
            let parsedTransports: [ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor.Transport] = credential.transports.compactMap { transport in
                switch transport {
                case "nfc":
                    return .nfc
                case "usb":
                    return .usb
                case "bluetooth":
                    return .bluetooth
                default:
                    return nil
                }
            }
            
            return ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor(
                credentialID: credentialData,
                transports: parsedTransports
            )
        }
    }
}

open class LocalAuth: NSObject {
    public static let shared = LocalAuth()
    private override init() {}
    
    var laContext = LAContext()
    
    func canAuthenticate() -> Bool {
        if #unavailable(iOS 16.0) {
            return false
        }
        return true
    }
    
    func hasBiometrics() -> Bool {
        var error: NSError?
        return laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }
}

struct PublicKeyCredentialCreateResponse: Codable {
    let challenge: String
    let user: User
    let rp: RP

    struct RP: Codable {
        let name: String
        let id: String
    }

    struct User: Codable {
        let name: String
        let displayName: String
        let id: String
    }
}

public extension Data {
    /// Same as Data(base64Encoded:), but adds padding automatically (if missing).
    static func fromBase64(_ encoded: String) -> Data? {
        var encoded = encoded
        let remainder = encoded.count % 4
        if remainder > 0 {
            encoded = encoded.padding(
                toLength: encoded.count + 4 - remainder,
                withPad: "=",
                startingAt: 0
            )
        }
        return Data(base64Encoded: encoded)
    }

    static func fromBase64Url(_ encoded: String) -> Data? {
        let base64String = base64UrlToBase64(base64Url: encoded)
        return fromBase64(base64String)
    }

    func toBase64URL() -> String {
        var result = self.base64EncodedString()
        result = result.replacingOccurrences(of: "+", with: "-")
        result = result.replacingOccurrences(of: "/", with: "_")
        result = result.replacingOccurrences(of: "=", with: "")
        return result
    }

    private static func base64UrlToBase64(base64Url: String) -> String {
        return base64Url.replacingOccurrences(of: "-", with: "+")
                         .replacingOccurrences(of: "_", with: "/")
    }
    
    
    /// init    - https://stackoverflow.com/questions/26501276/converting-hex-string-to-nsdata-in-swift
    init?(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        guard hex.count % 2 == 0 else { return nil }

        var data = Data(capacity: hex.count / 2)
        var index = hex.startIndex

        while index < hex.endIndex {
            let nextIndex = hex.index(index, offsetBy: 2)
            let byteString = hex[index..<nextIndex]
            guard let byte = UInt8(byteString, radix: 16) else { return nil }
            data.append(byte)
            index = nextIndex
        }

        self = data
    }
}

public extension String {
    static func fromBase64(_ encoded: String) -> String? {
        if let data = Data.fromBase64(encoded) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}

