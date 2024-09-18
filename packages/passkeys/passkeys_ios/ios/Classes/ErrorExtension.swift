import Foundation
import Flutter
import AuthenticationServices

@available(iOS 13.0, *)
extension FlutterError: Error {
    convenience init(from error: ASAuthorizationError) {
        var code = ""
        switch (error.code) {
        case ASAuthorizationError.unknown:
            code = "unknown"
            break
        case ASAuthorizationError.canceled:
            code = "cancelled"
            break
        case ASAuthorizationError.invalidResponse:
            code = "invalidResponse"
            break
        case ASAuthorizationError.notHandled:
            code = "notHandled"
            break
        case ASAuthorizationError.failed:
            if (error.localizedDescription.contains("is not associated with domain")) {
                code = "domain-not-associated"
            } else {
                code = "failed"
            }
            break
        default:
            code = "unknown"
            break
        }

        self.init(code: code, message: error.localizedDescription, details: "")
    }
    
    convenience init(fromNSError error: NSError) {
        var code = ""
        if (error.domain == "WKErrorDomain" && error.code == 8) {
            code = "exclude-credentials-match"
        } else {
            code = "ios-unhandled-" + error.domain
        }
 
        self.init(code: code, message: error.localizedDescription, details: "")
    }

    convenience init(code: CustomErrors, message: String = "") {
        self.init(code: String(describing: code), message: message, details: "")
    }
}

enum CustomErrors: Error {
    case decodingChallenge
    case decodingUserId
    case unexpectedAuthorizationResponse
    case unknown
}
