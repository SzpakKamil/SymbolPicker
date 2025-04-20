// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SymbolPicker",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v11), .iOS(.v14), .visionOS(.v1)
    ],
    products: [
        .library(name: "SymbolPicker", targets: ["SymbolPicker"])
    ],
    dependencies: [
        .package(url: "https://github.com/SzpakKamil/SearchBar.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "SymbolPicker", dependencies: [.product(name: "SearchBar", package: "SearchBar")]),

    ]
)
