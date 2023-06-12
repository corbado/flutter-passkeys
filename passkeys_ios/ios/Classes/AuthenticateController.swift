import AuthenticationServices
import LocalAuthentication
import Flutter
import Foundation

@available(iOS 15.0, *)
class AuthenticateController: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    private var completion: ((Result<AuthenticateResponse, Error>) -> Void)?

    func authenticate(request: ASAuthorizationPlatformPublicKeyCredentialAssertionRequest, completion: @escaping ((Result<AuthenticateResponse, Error>) -> Void)) {
        self.completion = completion;

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let r as ASAuthorizationPublicKeyCredentialAssertion:
            let response = AuthenticateResponse(
                id: r.credentialID.toBase64URL(),
                rawId: r.credentialID.toBase64URL(),
                clientDataJSON: r.rawClientDataJSON.toBase64URL(),
                authenticatorData: r.rawAuthenticatorData.toBase64URL(),
                signature: r.signature.toBase64URL()
            )

            completion?(.success(response))
            break
        default:
            print("error")
            completion?(.failure(RegisterError.unknown))
        }

    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("error")
        completion?(.failure(error))
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        print("presentation")
        let delegate = UIApplication.shared.delegate

        if let flutterDelegate = delegate as? FlutterAppDelegate {
            return flutterDelegate.window
        }

        return (delegate?.window!!)!
    }

}
