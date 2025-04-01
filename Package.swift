// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SymbolPicker",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v11), .iOS(.v14)
    ],
    products: [
        .library(name: "SymbolPicker", targets: ["SymbolPicker"])
    ],
    targets: [
        .target(
            name: "SymbolPicker", resources: [.process("Resources")]),

    ]
)
