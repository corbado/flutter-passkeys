// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "passkeys_darwin",
    platforms: [
        .iOS("13.0"),
        .macOS("10.15"),
    ],
    products: [
        .library(name: "passkeys-darwin", targets: ["passkeys_darwin"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "passkeys_darwin",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
