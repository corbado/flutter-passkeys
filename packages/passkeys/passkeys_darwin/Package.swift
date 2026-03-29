// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "passkeys_darwin",
    platforms: [
        .iOS("9.0"),
        .macOS("10.15")
    ],
    products: [
        .library(
            name: "passkeys-darwin",
            targets: ["passkeys_darwin"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "passkeys_darwin",
            dependencies: [],
            path: "darwin/Classes",
            resources: []
        )
    ],
    swiftLanguageVersions: [.v5]
)
