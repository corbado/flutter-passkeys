import AuthenticationServices
import LocalAuthentication
import Foundation

#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

@available(macOS 13.5, iOS 16.0, *)
class AuthenticateController: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding, Cancellable {
    public var completion: ((Result<AuthenticateResponse, Error>) -> Void)?
    private var innerCancel: (() -> Void)?;
    
    init(completion: @escaping ((Result<AuthenticateResponse, Error>) -> Void)) {
        self.completion = completion;
    }
    
    func run(requests: [ASAuthorizationRequest], conditionalUI: Bool, preferImmediatelyAvailableCredentials: Bool) {
        let authorizationController = ASAuthorizationController(authorizationRequests: requests)
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        
        if (conditionalUI) {
            #if os(iOS)
                        authorizationController.performAutoFillAssistedRequests()
            #elseif os(macOS)
                        authorizationController.performRequests()
            #endif
        } else {
            // The `.preferImmediatelyAvailableCredentials` option in `ASAuthorizationController`
            // does not distinguish between `true` and `false` values. If the option is included
            // in the `options` parameter, iOS assumes the behavior is enabled.
            if preferImmediatelyAvailableCredentials {
                authorizationController.performRequests(options: .preferImmediatelyAvailableCredentials)
            } else {
                authorizationController.performRequests()
            }
        }

        func cancel() {
            authorizationController.cancel();
        }

        self.innerCancel = cancel
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let r as ASAuthorizationSecurityKeyPublicKeyCredentialAssertion:
            let response = AuthenticateResponse(
                id: r.credentialID.toBase64URL(),
                rawId: r.credentialID.toBase64URL(),
                clientDataJSON: r.rawClientDataJSON.toBase64URL(),
                authenticatorData: r.rawAuthenticatorData.toBase64URL(),
                signature: r.signature.toBase64URL(),
                userHandle: r.userID?.toBase64URL()
            )

            completion?(.success(response))
            break
        case let r as ASAuthorizationPlatformPublicKeyCredentialAssertion:
            var prf: String? = nil
            if #available(iOS 18.0, *),
               let credPrf = r.prf {
                let prfBytes = credPrf.first.withUnsafeBytes({ Data($0) })
                prf = prfBytes.base64EncodedString()
            }
            
            let response = AuthenticateResponse(
                id: r.credentialID.toBase64URL(),
                rawId: r.credentialID.toBase64URL(),
                clientDataJSON: r.rawClientDataJSON.toBase64URL(),
                authenticatorData: r.rawAuthenticatorData.toBase64URL(),
                signature: r.signature.toBase64URL(),
                userHandle: r.userID?.toBase64URL(),
                clientExtensionResults: prf == nil ? nil : ["prf" :
                                                                ["enabled": true,
                                                                 "results": ["first": prf]
                                                                ]
                                                           ]
            )

            completion?(.success(response))
            break
        default:
            completion?(.failure(FlutterError(code: CustomErrors.unexpectedAuthorizationResponse)))
            break
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        if let err = error as? ASAuthorizationError {
            completion?(.failure(FlutterError(from: err)))
        }

        let nsErr = error as NSError
        completion?(.failure(FlutterError(fromNSError: nsErr)))
        return
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
#if os(iOS)
        if let flutterDelegate = UIApplication.shared.delegate as? FlutterAppDelegate,
            let window = flutterDelegate.window {
                return window
        }
        // Fallback: create a new window (shouldn't be reached if app is well configured)
        return UIWindow()
#elseif os(macOS)
        if let window = NSApplication.shared.windows.first {
            return window
        }
        // Fallback: create a new window (shouldn't be reached if app is well configured)
        return NSWindow()
#endif
    }
    
    func cancel() {
        innerCancel?()
    }
}
