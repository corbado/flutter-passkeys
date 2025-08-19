import AuthenticationServices
import LocalAuthentication
import Flutter
import Foundation

@available(iOS 16.0, *)
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
            authorizationController.performAutoFillAssistedRequests()
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
                userHandle: r.userID.toBase64URL()
            )

            completion?(.success(response))
            break
        case let r as ASAuthorizationPlatformPublicKeyCredentialAssertion:
            let response = AuthenticateResponse(
                id: r.credentialID.toBase64URL(),
                rawId: r.credentialID.toBase64URL(),
                clientDataJSON: r.rawClientDataJSON.toBase64URL(),
                authenticatorData: r.rawAuthenticatorData.toBase64URL(),
                signature: r.signature.toBase64URL(),
                userHandle: r.userID.toBase64URL()
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
        if let flutterDelegate = UIApplication.shared.delegate as? FlutterAppDelegate,
            let window = flutterDelegate.window {
                return window
            }

        // Fallback to the first available window from the connected scenes
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            return window
        }

        // Last resort: create a new window
        return UIWindow()
    }
    
    func cancel() {
        innerCancel?()
    }
}
