//
//  Package.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

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
        .package(url: "https://github.com/SzpakKamil/SearchBar.git", from: "2.1.6"),
        .package(url: "https://github.com/SzpakKamil/ColorKit.git", from: "1.0.0")
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
    ]
)

