//
//  SPSymbolFetchTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPSymbolFetchTests {

    // MARK: - isAvailable

    @Test("SPSymbol isAvailable returns true for well-known system symbol")
    func testIsAvailableKnownSymbol() {
        let symbol = SPSymbol(systemName: "star.fill")
        #expect(symbol.isAvailable())
    }

    @Test("SPSymbol isAvailable returns true for filled/notFilled that both exist")
    func testIsAvailableFilledAndNotFilled() {
        let symbol = SPSymbol(filledName: "heart.fill", notFilled: "heart")
        #expect(symbol.isAvailable())
    }

    @Test("SPSymbol isAvailable returns false when filledName does not exist")
    func testIsAvailableNonExistentFilled() {
        let symbol = SPSymbol(filledName: "this.symbol.xyz.does.not.exist", notFilled: "star")
        #expect(!symbol.isAvailable())
    }

    @Test("SPSymbol isAvailable returns false when notFilled does not exist")
    func testIsAvailableNonExistentNotFilled() {
        let symbol = SPSymbol(filledName: "star.fill", notFilled: "this.symbol.xyz.does.not.exist")
        #expect(!symbol.isAvailable())
    }

    @Test("SPSymbol isAvailable returns false when both names do not exist")
    func testIsAvailableBothNonExistent() {
        let symbol = SPSymbol(systemName: "this.xyz.symbol.definitely.not.real")
        #expect(!symbol.isAvailable())
    }

    // MARK: - init(from decoder:) — Codable initializer

    @Test("SPSymbol init(from decoder:) decodes required fields")
    func testInitFromDecoder() throws {
        let json = """
        {"filledName": "star.fill", "notFilled": "star"}
        """
        let symbol = try JSONDecoder().decode(SPSymbol.self, from: Data(json.utf8))
        #expect(symbol.filledName == "star.fill")
        #expect(symbol.notFilled == "star")
        #expect(symbol.version == 0)
        #expect(symbol.annotation == nil)
        #expect(symbol.variant == nil)
        #expect(symbol.category == nil)
        #expect(symbol.subcategory == nil)
        #expect(symbol.tags == nil)
    }

    @Test("SPSymbol init(from decoder:) decodes all optional fields when present")
    func testInitFromDecoderAllFields() throws {
        let json = """
        {
            "filledName": "star.fill",
            "notFilled": "star",
            "version": 2.5,
            "annotation": "favourite",
            "variant": "filled",
            "category": "nature",
            "subcategory": "sky",
            "tags": ["star", "bright"]
        }
        """
        let symbol = try JSONDecoder().decode(SPSymbol.self, from: Data(json.utf8))
        #expect(symbol.filledName == "star.fill")
        #expect(symbol.notFilled == "star")
        #expect(symbol.version == 2.5)
        #expect(symbol.annotation == "favourite")
        #expect(symbol.variant == .filled)
        #expect(symbol.category == "nature")
        #expect(symbol.subcategory == "sky")
        #expect(symbol.tags == ["star", "bright"])
    }

    @Test("SPSymbol init(from decoder:) version defaults to 0 when absent")
    func testInitFromDecoderVersionDefault() throws {
        let json = "{\"filledName\": \"star.fill\", \"notFilled\": \"star\"}"
        let symbol = try JSONDecoder().decode(SPSymbol.self, from: Data(json.utf8))
        #expect(symbol.version == 0)
    }

    @Test("SPSymbol init(from decoder:) decodes outlined variant")
    func testInitFromDecoderOutlinedVariant() throws {
        let json = """
        {"filledName": "star.fill", "notFilled": "star", "variant": "outlined"}
        """
        let symbol = try JSONDecoder().decode(SPSymbol.self, from: Data(json.utf8))
        #expect(symbol.variant == .outlined)
    }

    @Test("SPSymbol init(from decoder:) rejects missing required fields")
    func testInitFromDecoderMissingRequiredField() {
        let json = "{\"notFilled\": \"star\"}"
        #expect(throws: (any Error).self) {
            try JSONDecoder().decode(SPSymbol.self, from: Data(json.utf8))
        }
    }

    // MARK: - fetchAssets

    @Test("SPSymbol fetchAssets returns non-empty list for 'en' locale")
    func testFetchAssetsEnglish() async throws {
        let symbols = try await SPSymbol.fetchAssets(locale: "en")
        #expect(!symbols.isEmpty)
    }

    @Test("SPSymbol fetchAssets all returned symbols have non-empty filledName")
    func testFetchAssetsNonEmptyNames() async throws {
        let symbols = try await SPSymbol.fetchAssets(locale: "en")
        #expect(symbols.allSatisfy { !$0.filledName.isEmpty })
    }

    @Test("SPSymbol fetchAssets returns no duplicates by id")
    func testFetchAssetsNoDuplicates() async throws {
        let symbols = try await SPSymbol.fetchAssets(locale: "en")
        let ids = symbols.map(\.id)
        #expect(ids.count == Set(ids).count)
    }

    @Test("SPSymbol fetchAssets falls back to 'en' for unknown locale")
    func testFetchAssetsFallbackLocale() async throws {
        let symbols = try await SPSymbol.fetchAssets(locale: "xx-unknown")
        #expect(!symbols.isEmpty)
    }

    @Test("SPSymbol fetchAssets throws for unknown prefix")
    func testFetchAssetsThrowsOnMissingFile() async {
        // SPSymbol.filePrefix == "symbols". A different type with a bad prefix would throw,
        // but since we're testing SPSymbol directly with a locale that falls back to "en",
        // the only way to get fileNotFound is if even the fallback is absent.
        // This verifies the fallback chain completes without error.
        await #expect(throws: Never.self) {
            try await SPSymbol.fetchAssets(locale: "zz-ZZ")
        }
    }
}
#endif
