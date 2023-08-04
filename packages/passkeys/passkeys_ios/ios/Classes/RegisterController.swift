import AuthenticationServices
import LocalAuthentication
import Flutter
import Foundation

@available(iOS 15.0, *)
class RegisterController: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    private var completion: ((Result<RegisterResponse, Error>) -> Void)?

    func register(request: ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest, completion: @escaping ((Result<RegisterResponse, Error>) -> Void)) {
        self.completion = completion;
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentialRegistration as ASAuthorizationPlatformPublicKeyCredentialRegistration:
            let response = RegisterResponse(
                id: credentialRegistration.credentialID.toBase64URL(),
                rawId: credentialRegistration.credentialID.toBase64URL(),
                clientDataJSON: credentialRegistration.rawClientDataJSON.toBase64URL(),
                attestationObject: credentialRegistration.rawAttestationObject!.toBase64URL()
            )
            completion?(.success(response))
            break
        default:
            let message = "Expected instance of ASAuthorizationPlatformPublicKeyCredentialRegistration but got: " + authorization.credential.description
            completion?(.failure(FlutterError(code: CustomErrors.unexpectedAuthorizationResponse, message: message)))
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
}
