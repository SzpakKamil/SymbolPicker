//
//  SPPageTypeTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPPageTypeTests {

    @Test("SPPageType rawValues")
    func testRawValues() {
        #expect(SPPageType.emoji.rawValue == "Emoji")
        #expect(SPPageType.symbol.rawValue == "Symbol")
    }

    @Test("SPPageType Identifiable uses rawValue as id")
    func testIdentifiable() {
        #expect(SPPageType.emoji.id == "Emoji")
        #expect(SPPageType.symbol.id == "Symbol")
    }

    @Test("SPPageType systemName")
    func testSystemName() {
        #expect(SPPageType.emoji.systemName == "hand.thumbsup.fill")
        #expect(SPPageType.symbol.systemName == "star.fill")
    }

    @Test("SPPageType allCases contains emoji and symbol")
    func testAllCasesContainsBaseTypes() {
        #expect(SPPageType.allCases.contains(.emoji))
        #expect(SPPageType.allCases.contains(.symbol))
    }

    @Test("SPPageType localizedDescription is non-empty")
    func testLocalizedDescription() {
        #expect(!SPPageType.emoji.localizedDescription.isEmpty)
        #expect(!SPPageType.symbol.localizedDescription.isEmpty)
    }

    @Test("SPPageType Equatable")
    func testEquatable() {
        #expect(SPPageType.emoji == .emoji)
        #expect(SPPageType.symbol == .symbol)
        #expect(SPPageType.emoji != .symbol)
    }

    @Test("SPPageType Hashable")
    func testHashable() {
        let set: Set<SPPageType> = [.emoji, .symbol, .emoji]
        #expect(set.count == 2)
        #expect(set.contains(.emoji))
        #expect(set.contains(.symbol))
    }

    @Test("SPPageType Codable round-trip")
    func testCodable() throws {
        for pageType in SPPageType.allCases {
            let encoded = try JSONEncoder().encode(pageType)
            let decoded = try JSONDecoder().decode(SPPageType.self, from: encoded)
            #expect(decoded == pageType)
        }
    }
}
#endif
