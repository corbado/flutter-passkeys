import AuthenticationServices
import LocalAuthentication
import Flutter
import Foundation

@available(iOS 16.0, *)
class RegisterController: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding, Cancellable {
    private var completion: ((Result<RegisterResponse, Error>) -> Void)?
    private var cancelAuthorization: (() -> Void)?;

    init(completion: @escaping ((Result<RegisterResponse, Error>) -> Void)) {
        self.completion = completion;
    }
    
    func run(requests: [ASAuthorizationRequest]) {
        
        let authorizationController = ASAuthorizationController(authorizationRequests: requests)

        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        
        func cancel() {
            authorizationController.cancel();
        }
        
        self.cancelAuthorization = cancel
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentialRegistration as ASAuthorizationPlatformPublicKeyCredentialRegistration:
            let response = RegisterResponse(
                id: credentialRegistration.credentialID.toBase64URL(),
                rawId: credentialRegistration.credentialID.toBase64URL(),
                clientDataJSON: credentialRegistration.rawClientDataJSON.toBase64URL(),
                attestationObject: credentialRegistration.rawAttestationObject!.toBase64URL(),
                transports: [],
                authenticatorData: credentialRegistration.rawAuthenticatorData.toBase64URL()
            )
            completion?(.success(response))
            break
        case let securityKeyRegistration as ASAuthorizationSecurityKeyPublicKeyCredentialRegistration:
            var transportStrings: [String] = []
            
            if #available(iOS 17.5, *) {
                for transport in securityKeyRegistration.transports {
                    switch transport {
                    case .usb:
                        transportStrings.append("usb")
                    case .nfc:
                        transportStrings.append("nfc")
                    case .bluetooth:
                        transportStrings.append("bluetooth")
                    default:
                        transportStrings.append("unknown")
                    }
                }
            }

                
            let response = RegisterResponse(
                id: securityKeyRegistration.credentialID.toBase64URL(),
                rawId: securityKeyRegistration.credentialID.toBase64URL(),
                clientDataJSON: securityKeyRegistration.rawClientDataJSON.toBase64URL(),
                attestationObject: securityKeyRegistration.rawAttestationObject!.toBase64URL(),
                transports: transportStrings,
                authenticatorData: securityKeyRegistration.rawAuthenticatorData.toBase64URL()
            )
            completion?(.success(response))
            break
        default:
            let message = "Expected instance of ASAuthorizationPlatformPublicKeyCredentialRegistration or ASAuthorizationSecurityKeyPublicKeyCredentialRegistration but got: " + authorization.credential.description
            completion?(.failure(FlutterError(code: CustomErrors.unexpectedAuthorizationResponse, message: message)))
        }

    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        if let err = error as? ASAuthorizationError {
            completion?(.failure(FlutterError(from: err)))
            return
        }
        
        let nsErr = error as NSError
        completion?(.failure(FlutterError(fromNSError: nsErr)))
        return
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        let delegate = UIApplication.shared.delegate

        if let flutterDelegate = delegate as? FlutterAppDelegate {
            return flutterDelegate.window
        }

        return (delegate?.window!!)!
    }
    
    func cancel() {
        cancelAuthorization?();
    }
}
