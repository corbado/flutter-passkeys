import Flutter
import UIKit
import AuthenticationServices
import LocalAuthentication
import Foundation
import Combine

protocol Cancellable {
    func cancel()
}

@available(iOS 16.0, *)
public class PasskeysPlugin: NSObject, FlutterPlugin, PasskeysApi {
    var inFlightController: Cancellable?;
    let lock: NSLock = NSLock();
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = PasskeysPlugin()
        PasskeysApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
    }
    
    func canAuthenticate() throws -> Bool {
        return LocalAuth.shared.canAuthenticate()
    }

    func getFacetID(completion: @escaping (Result<String, Error>) -> Void) {
        completion(.success(""))
    }
    
    func register(
        challenge: String,
        relyingParty: RelyingParty,
        user: User,
        excludeCredentialIDs: [String],
        completion: @escaping (Result<RegisterResponse, Error>) -> Void
    ) {        
        guard let decodedChallenge = Data.fromBase64Url(challenge) else {
            completion(.failure(CustomErrors.decodingChallenge))
            return
        }
        
        guard let decodedUserId = Data.fromBase64(user.id) else {
            completion(.failure(CustomErrors.decodingUserId))
            return
        }
        
        
        let rp = relyingParty.id
        let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: rp)
        let request = platformProvider.createCredentialRegistrationRequest(
            challenge: decodedChallenge,
            name: user.name,
            userID: decodedUserId
        )

        if #available(iOS 17.4, *) {
            request.excludedCredentials = parseCredentials(credentialIDs: excludeCredentialIDs)
        }

        func wrappedCompletion(result: Result<RegisterResponse, Error>) {
            lock.unlock()
            completion(result)
        }
        
        let con = RegisterController(completion: completion)
        con.run(request: request)
        inFlightController = con
    }

    func authenticate(relyingPartyId: String, challenge: String, conditionalUI: Bool, allowedCredentialIDs: [String], completion: @escaping (Result<AuthenticateResponse, Error>) -> Void) {

        guard let decodedChallenge = Data.fromBase64Url(challenge) else {
            completion(.failure(CustomErrors.decodingChallenge))
            return
        }

        let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: relyingPartyId)
        let request = platformProvider.createCredentialAssertionRequest(
            challenge: decodedChallenge
        )
                
        request.allowedCredentials = parseCredentials(credentialIDs: allowedCredentialIDs)
                
        let con = AuthenticateController(completion: completion)
        con.run(request: request, conditionalUI: conditionalUI)
        inFlightController = con
    }
    
    func cancelCurrentAuthenticatorOperation(completion: @escaping (Result<Void, Error>) -> Void) {
        inFlightController?.cancel()
        
        completion(.success(Void()))
    }

    func goToSettings(completion: @escaping (Result<Void, Error>) -> Void) {
        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, options: [:], completionHandler: { success in
                    if success {
                        completion(.success(Void()))
                    }
                })
            }
        }
    }

    private func parseCredentials(credentialIDs: [String]) -> [ASAuthorizationPlatformPublicKeyCredentialDescriptor] {
        return credentialIDs.compactMap {
            if let credentialId = Data.fromBase64Url($0) {
                return ASAuthorizationPlatformPublicKeyCredentialDescriptor.init(credentialID: credentialId)
            } else {
                return nil
            }
        }
    }
}

open class LocalAuth: NSObject {
    public static let shared = LocalAuth()

    override private init() {}

    var laContext = LAContext()

    func canAuthenticate() -> Bool {
        var error: NSError?
        let hasTouchId = laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        return hasTouchId
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
    /// Same as ``Data(base64Encoded:)``, but adds padding automatically
    /// (if missing, instead of returning `nil`).
    static func fromBase64(_ encoded: String) -> Data? {
        // Prefixes padding-character(s) (if needed).
        var encoded = encoded
        let remainder = encoded.count % 4
        if remainder > 0 {
            encoded = encoded.padding(
                toLength: encoded.count + 4 - remainder,
                withPad: "=", startingAt: 0
            )
        }

        // Finally, decode.
        return Data(base64Encoded: encoded)
    }

    static func fromBase64Url(_ encoded: String) -> Data? {
        let base64String = base64UrlToBase64(base64Url: encoded)
        return fromBase64(base64String)
    }

    private static func base64UrlToBase64(base64Url: String) -> String {
        let base64 = base64Url
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")

        return base64
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

extension Data {
    func toBase64URL() -> String {
        let current = self

        var result = current.base64EncodedString()
        result = result.replacingOccurrences(of: "+", with: "-")
        result = result.replacingOccurrences(of: "/", with: "_")
        result = result.replacingOccurrences(of: "=", with: "")
        return result
    }
}
