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
    
    func run(request: ASAuthorizationPlatformPublicKeyCredentialAssertionRequest, conditionalUI: Bool) {
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        
        if (conditionalUI) {
            authorizationController.performAutoFillAssistedRequests()
        } else {
            authorizationController.performRequests(options: .preferImmediatelyAvailableCredentials)
        }

        func cancel() {
            authorizationController.cancel();
        }
        
        self.innerCancel = cancel
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let r as ASAuthorizationPublicKeyCredentialAssertion:
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

        completion?(.failure(FlutterError(code: CustomErrors.unknown)))
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        let delegate = UIApplication.shared.delegate

        if let flutterDelegate = delegate as? FlutterAppDelegate {
            return flutterDelegate.window
        }

        return (delegate?.window!!)!
    }
    
    func cancel() {
        innerCancel?()
    }
}
