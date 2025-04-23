import Flutter
import UIKit

extension FlutterError: Error {}

public class CorbadoAuthDoctorPlugin: NSObject, FlutterPlugin, WebCredentialsApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: WebCredentialsApi & NSObjectProtocol = CorbadoAuthDoctorPlugin.init()
        WebCredentialsApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    func getWebCredentialsDomains() throws -> DomainsResult {
        // 1. Load embedded.mobileprovision
        guard
            let url = Bundle.main.url(forResource: "embedded", withExtension: "mobileprovision"),
            let data = try? Data(contentsOf: url),
            let ascii = String(data: data, encoding: .ascii)
        else {
            // No provisioning embedded (e.g. App Store build), or unreadable
            throw FlutterError(
                code: "UNAVAILABLE",
                message: "Could not find or read embedded.mobileprovision",
                details: nil
            )
        }

        // 2. Extract the XML plist section
        let scanner = Scanner(string: ascii)
        var chunk: NSString?
        scanner.scanUpTo("<plist", into: nil)
        scanner.scanUpTo("</plist>", into: &chunk)
        guard let xmlStart = chunk as String? else {
            throw FlutterError(
                code: "PARSE_ERROR",
                message: "Failed to extract plist from mobileprovision",
                details: nil
            )
        }
        let fullXml = xmlStart + "</plist>"

        // 3. Deserialize and dig into Entitlements
        guard
            let plistData = fullXml.data(using: .utf8),
            let full = try? PropertyListSerialization.propertyList(
                from: plistData,
                options: [],
                format: nil
            ) as? [String: Any],
            let ent = full["Entitlements"] as? [String: Any],
            let assoc = ent["com.apple.developer.associated-domains"] as? [String]
        else {
            throw FlutterError(
                code: "PARSE_ERROR",
                message: "Malformed provisioning plist",
                details: nil
            )
        }

        // 4. Filter all "webcredentials:" entries
        let domains =
            assoc
            .filter { $0.hasPrefix("webcredentials:") }
            .map { String($0.dropFirst("webcredentials:".count)) }

        // 5. Return them in the Pigeon result
        return DomainsResult(domains: domains)
    }
}
