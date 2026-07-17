import Foundation
import AuthenticationServices

#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

@available(iOS 13.0, *)
extension FlutterError: Error {
    convenience init(from error: ASAuthorizationError) {
        var code = ""
        switch (error.code) {
        case ASAuthorizationError.unknown:
            code = "unknown"
            break
        case ASAuthorizationError.canceled:
            // Apple returns `.canceled` both when the user dismisses the sheet
            // and when there are no credentials available, and intentionally
            // exposes no locale independent way to tell them apart in the modal
            // flow. `preferImmediatelyAvailableCredentials` avoids this ambiguity
            // by surfacing `.notInteractive` instead (handled below). As a best
            // effort for the modal flow we still inspect the error strings.
            if (isNoCredentialsAvailable(error)) {
                code = "no-credentials-available"
            } else {
                code = "cancelled"
            }
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
            // ASAuthorizationError code 1005 (.notInteractive, iOS 15+) is returned
            // when `preferImmediatelyAvailableCredentials` is set and no credentials
            // are available, without showing any UI. This is the only reliable,
            // locale independent signal for the no credentials case.
            if error.code.rawValue == 1005 {
                code = "no-credentials-available"
            }
            // ASAuthorizationError code 1006 (.matchedExcludedCredential, iOS 18+)
            // indicates the device already holds a credential listed in excludeCredentials.
            else if error.code.rawValue == 1006 {
                code = "exclude-credentials-match"
            } else {
                code = "unknown"
            }
            break
        }

        self.init(code: code, message: error.localizedDescription, details: "")
    }
    
    convenience init(fromNSError error: NSError) {
        var code = ""
        if (error.domain == "WKErrorDomain" && error.code == 8) {
            code = "exclude-credentials-match"
        }else if(error.domain == "WKErrorDomain" && error.code == 31){
            // This error happens when the security key prompt times out (2 minutes)
            code = "ios-security-key-timeout"
        } else {
            code = "ios-unhandled-" + error.domain
        }
 
        self.init(code: code, message: error.localizedDescription, details: "")
    }

    convenience init(code: CustomErrors, message: String = "") {
        self.init(code: String(describing: code), message: message, details: "")
    }
}

@available(iOS 13.0, *)
private func isNoCredentialsAvailable(_ error: ASAuthorizationError) -> Bool {
    let nsError = error as NSError
    let candidates = [
        error.localizedDescription,
        nsError.userInfo[NSLocalizedFailureReasonErrorKey] as? String,
        nsError.userInfo[NSDebugDescriptionErrorKey] as? String,
        (nsError.userInfo[NSUnderlyingErrorKey] as? NSError)?.localizedDescription,
    ]

    return candidates
        .compactMap { $0 }
        .contains { $0.contains("No credentials available for login.") }
}

enum CustomErrors: Error {
    case deviceNotSupported
    case decodingChallenge
    case unexpectedAuthorizationResponse
    case unknown
}
