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
            var prf: String? = nil
            if #available(iOS 18.0, *),
               let credPrf = credentialRegistration.prf,
               let prfBytes = credPrf.first?.withUnsafeBytes({ Data($0) }) {
                prf = prfBytes.base64EncodedString()
            }
            
            let response = RegisterResponse(
                id: credentialRegistration.credentialID.toBase64URL(),
                rawId: credentialRegistration.credentialID.toBase64URL(),
                clientDataJSON: credentialRegistration.rawClientDataJSON.toBase64URL(),
                attestationObject: credentialRegistration.rawAttestationObject!.toBase64URL(),
                transports: [],
                clientExtensionResults: prf == nil ? nil : ["prf" :
                                                                ["enabled": true,
                                                                 "results": ["first": prf]
                                                                ]
                                                           ]
            )
            
            completion?(.success(response))
            break
        case let securityKeyRegistration as ASAuthorizationSecurityKeyPublicKeyCredentialRegistration:
            var transportStrings: [String] = []
            
            if #available(iOS 17.5, *) {
                // Note: The "transports" field can be optional in the authenticator response.
                // While the WebAuthn spec (https://www.w3.org/TR/webauthn-2/#dom-authenticatorattestationresponse-gettransports)
                // does not strictly specify that "transports" must be omitted, we have observed several cases
                // where authenticators do not return it.
                if let transports = (securityKeyRegistration.value(forKey: "transports") as? [ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor.Transport]) {
                        for transport in transports {
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
            }
                
            let response = RegisterResponse(
                id: securityKeyRegistration.credentialID.toBase64URL(),
                rawId: securityKeyRegistration.credentialID.toBase64URL(),
                clientDataJSON: securityKeyRegistration.rawClientDataJSON.toBase64URL(),
                attestationObject: securityKeyRegistration.rawAttestationObject!.toBase64URL(),
                transports: transportStrings
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
        cancelAuthorization?();
    }
}
