// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SymbolPicker",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .library(name: "SymbolPicker", targets: ["SymbolPicker"])
    ],
    targets: [
        .target(
            name: "SymbolPicker"),

    ]
)
