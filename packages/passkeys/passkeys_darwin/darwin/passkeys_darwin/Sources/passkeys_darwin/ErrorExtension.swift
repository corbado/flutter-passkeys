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
extension PigeonError {
    convenience init(from error: ASAuthorizationError) {
        var code = ""
        switch (error.code) {
        case ASAuthorizationError.unknown:
            code = "unknown"
            break
        case ASAuthorizationError.canceled:
            // Apple returns `.canceled` both when the user dismisses the sheet
            // and when there are no credentials available, including with
            // `preferImmediatelyAvailableCredentials` (observed on iOS 26).
            // Only the latter carries a failure reason; see
            // `isNoCredentialsAvailable`.
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
            // ASAuthorizationError code 1005 (.notInteractive, iOS 15+) is documented
            // for `preferImmediatelyAvailableCredentials` when no credentials are
            // available, although iOS 26 returns `.canceled` instead (see above).
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

/// A `.canceled` for missing credentials carries a failure reason ("No
/// credentials available for login.", localized to the device language), while
/// a dismissed sheet carries none, so the presence of the key works in any
/// language. The message check is kept as a fallback.
@available(iOS 13.0, *)
private func isNoCredentialsAvailable(_ error: ASAuthorizationError) -> Bool {
    let nsError = error as NSError
    if nsError.userInfo[NSLocalizedFailureReasonErrorKey] != nil {
        return true
    }
    let candidates = [
        error.localizedDescription,
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
