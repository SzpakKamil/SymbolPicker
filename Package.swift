// swift-tools-version: 6.0
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
        .package(url: "https://github.com/SzpakKamil/SearchBar.git", from: "2.1.4")
    ],
    targets: [
        .target(
            name: "SymbolPicker",
            dependencies: [.product(name: "SearchBar", package: "SearchBar")],
            resources: [
                .process("Resources/emojis_bn.json"),
                .process("Resources/emojis_da.json"),
                .process("Resources/emojis_de.json"),
                .process("Resources/emojis_en.json"),
                .process("Resources/emojis_en-gb.json"),
                .process("Resources/emojis_es.json"),
                .process("Resources/emojis_es-mx.json"),
                .process("Resources/emojis_et.json"),
                .process("Resources/emojis_fi.json"),
                .process("Resources/emojis_fr.json"),
                .process("Resources/emojis_hi.json"),
                .process("Resources/emojis_hu.json"),
                .process("Resources/emojis_it.json"),
                .process("Resources/emojis_ja.json"),
                .process("Resources/emojis_ko.json"),
                .process("Resources/emojis_lt.json"),
                .process("Resources/emojis_ms.json"),
                .process("Resources/emojis_nb.json"),
                .process("Resources/emojis_nl.json"),
                .process("Resources/emojis_pl.json"),
                .process("Resources/emojis_pt.json"),
                .process("Resources/emojis_ru.json"),
                .process("Resources/emojis_sv.json"),
                .process("Resources/emojis_uk.json"),
                .process("Resources/emojis_zh.json"),
                .process("Resources/emojis_zh-hant.json"),
                .process("Resources/symbols_en.json"),
            ]
        ),
    ]
)

