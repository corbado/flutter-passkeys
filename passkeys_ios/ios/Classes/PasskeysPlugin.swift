import Flutter
import UIKit
import AuthenticationServices
import LocalAuthentication
import Foundation
import Combine

@available(iOS 15.0, *)
public class PasskeysPlugin: NSObject, FlutterPlugin, PasskeysApi {
    let registerController: RegisterController
    let authenticateController: AuthenticateController
    
    init(registerController: RegisterController, authenticateController: AuthenticateController) {
        self.registerController = registerController
        self.authenticateController = authenticateController
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let registerController = RegisterController()
        let authenticateController = AuthenticateController()
        let instance = PasskeysPlugin(registerController: registerController, authenticateController: authenticateController)
        PasskeysApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
    }
    
    func canAuthenticate() throws -> Bool {
        return LocalAuth.shared.canAuthenticate()
    }
    
    func register(
        challenge: String,
        relyingParty: RelyingParty,
        user: User,
        completion: @escaping (Result<RegisterResponse, Error>) -> Void
    ) {
        guard let challenge = Data.fromBase64Url(challenge) else {
            completion(.failure(RegisterError.decodingChallenge))
            return
        }
        
        let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: relyingParty.id)
        let request = platformProvider.createCredentialRegistrationRequest(
            challenge: challenge,
            name: user.name,
            userID: user.id.data(using: .utf8)!
        )
        
        registerController.register(request: request, completion: completion)
    }
    
    func authenticate(relyingPartyId: String, challenge: String, completion: @escaping (Result<AuthenticateResponse, Error>) -> Void) {
        guard let decodedChallenge = Data.fromBase64Url(challenge) else {
            completion(.failure(AuthenticateError.decodingChallenge))
            return
        }
        
        let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: relyingPartyId)
        let request = platformProvider.createCredentialAssertionRequest(
            challenge: decodedChallenge
        )

        authenticateController.authenticate(request: request, completion: completion)
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

enum RegisterError: Error {
    case decodingChallenge
    case unknown
}

enum AuthenticateError: Error {
    case decodingChallenge
    case unknown
}
