// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SymbolPicker",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v12), .iOS(.v15), .visionOS(.v1), .watchOS(.v10), .tvOS(.v15)
    ],
    products: [
        .library(name: "SymbolPicker", targets: ["SymbolPicker"])
    ],
    dependencies: [
        .package(url: "https://github.com/SzpakKamil/SearchBar.git", exact: "2.1.7"),
        .package(url: "https://github.com/SzpakKamil/ColorKit.git", exact: "1.0.0")
    ],
    targets: [
        .target(
            name: "SymbolPicker",
            dependencies: [
                .product(name: "SearchBar", package: "SearchBar"),
                .product(name: "ColorKit", package: "ColorKit")
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "SymbolPickerTests",
            dependencies: [
                "SymbolPicker",
                .product(name: "ColorKit", package: "ColorKit")
            ]
        ),
    ]
)

