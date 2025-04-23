import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let channelName = "com.example.app/entitlements"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: channelName, binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { call, result in
      switch call.method {
      case "getEntitlements":
        result(self.readEntitlements())
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func readEntitlements() -> [String: Any]? {
    guard let path = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision"),
          let raw = try? String(contentsOfFile: path, encoding: .isoLatin1)
    else { return nil }

    let scanner = Scanner(string: raw)
    scanner.scanUpTo("<plist", into: nil)
    var plistString: NSString?
    scanner.scanUpTo("</plist>", into: &plistString)
    guard let xml = (plistString as String?)?.appending("</plist>"),
          let data = xml.data(using: .isoLatin1)
    else { return nil }

    // Deserialize with PropertyListSerialization
    let plist = try? PropertyListSerialization
      .propertyList(from: data, options: [], format: nil)
    let dict = (plist as? [String: Any])?["Entitlements"] as? [String: Any]
    return dict
  }
}
