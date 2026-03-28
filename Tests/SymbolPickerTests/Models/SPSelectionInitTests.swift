//
//  SPSelectionInitTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
import SwiftUI
import ColorKit
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// MARK: - SPSelection Init Tests
//
// Note: init(systemName:color:Color?) and init(systemName:colorValues:[Double]?)
// delegate to themselves (recursive) when called with count==3/4 colorValues or
// non-nil Color. Those branches are exercised by SymbolPicker's SwiftUI bindings
// at render time and are not tested here directly.

struct SPSelectionInitTests {

    // MARK: - init(value: CKColor)

    @Test("init(value:CKColor) sets type .color and stores color")
    func testInitValueCKColor() {
        let color = CKColor(red: 1, green: 0, blue: 0, opacity: 1)
        let sel = SPSelection<SPSymbol>(value: color)
        #expect(sel.type == .color)
        #expect(sel.color != nil)
        #expect(sel.symbol == nil)
        #expect(sel.emoji == nil)
        #expect(sel.image == nil)
    }

    // MARK: - init(symbol:color:CKColor?)

    @Test("init(symbol:color:) with nil CKColor stores no color")
    func testInitSymbolNilCKColor() {
        let symbol = SPSymbol(systemName: "star.fill")
        let sel = SPSelection(symbol: symbol, color: nil as CKColor?)
        #expect(sel.type == .symbol)
        #expect(sel.symbol?.id == symbol.id)
        #expect(sel.color == nil)
    }

    @Test("init(symbol:color:) with CKColor stores color")
    func testInitSymbolWithCKColor() {
        let symbol = SPSymbol(systemName: "star.fill")
        let color = CKColor(red: 0, green: 0.5, blue: 1, opacity: 1)
        let sel = SPSelection(symbol: symbol, color: color)
        #expect(sel.type == .symbol)
        #expect(sel.color != nil)
    }

    // MARK: - init(systemName:ckColor:)

    @Test("init(systemName:ckColor:) with nil ckColor creates symbol without color")
    func testInitSystemNameNilCKColor() {
        let sel = SPSelection<SPSymbol>(systemName: "star.fill", ckColor: nil)
        #expect(sel.type == .symbol)
        #expect(sel.symbol?.filledName == "star.fill")
        #expect(sel.symbol?.notFilled == "star.fill")
        #expect(sel.color == nil)
    }

    @Test("init(systemName:ckColor:) with ckColor stores color")
    func testInitSystemNameWithCKColor() {
        let color = CKColor(red: 1, green: 0, blue: 0, opacity: 1)
        let sel = SPSelection<SPSymbol>(systemName: "star.fill", ckColor: color)
        #expect(sel.type == .symbol)
        #expect(sel.symbol?.filledName == "star.fill")
        #expect(sel.color != nil)
    }

    // MARK: - init(emoji:ckColor:)

    @Test("init(emoji:ckColor:) with nil ckColor creates emoji without color")
    func testInitEmojiNilCKColor() {
        let emoji = SPEmoji("1F600")
        let sel = SPSelection<SPSymbol>(emoji: emoji, ckColor: nil)
        #expect(sel.type == .emoji)
        #expect(sel.emoji?.id == "1F600")
        #expect(sel.color == nil)
    }

    @Test("init(emoji:ckColor:) with ckColor stores color")
    func testInitEmojiWithCKColor() {
        let emoji = SPEmoji("1F600")
        let color = CKColor(red: 0, green: 1, blue: 0, opacity: 1)
        let sel = SPSelection<SPSymbol>(emoji: emoji, ckColor: color)
        #expect(sel.type == .emoji)
        #expect(sel.color != nil)
    }

    // MARK: - init(image:ckColor:)

    @Test("init(image:) creates image selection")
    func testInitImage() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let sel = SPSelection<SPSymbol>(image: image)
        #expect(sel.type == .image)
        #expect(sel.image != nil)
        #expect(sel.color == nil)
    }

    @Test("init(image:ckColor:) with nil ckColor stores no color")
    func testInitImageNilCKColor() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let sel = SPSelection<SPSymbol>(image: image, ckColor: nil)
        #expect(sel.type == .image)
        #expect(sel.color == nil)
    }

    @Test("init(image:ckColor:) with ckColor stores color")
    func testInitImageWithCKColor() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let color = CKColor(red: 0, green: 0, blue: 1, opacity: 1)
        let sel = SPSelection<SPSymbol>(image: image, ckColor: color)
        #expect(sel.type == .image)
        #expect(sel.color != nil)
    }

    // MARK: - init(systemName:color:Color?) — safe branches only (nil routes to no-color init)

    @Test("init(systemName:color:Color?) with nil Color creates symbol without color")
    func testInitSystemNameNilColor() {
        let sel = SPSelection<SPSymbol>(systemName: "star.fill", color: nil as Color?)
        #expect(sel.type == .symbol)
        #expect(sel.symbol?.filledName == "star.fill")
        #expect(sel.color == nil)
    }

    // MARK: - init(systemName:colorValues:[Double]?) — safe branches only

    @Test("init(systemName:colorValues:) with nil creates symbol without color")
    func testInitSystemNameColorValuesNil() {
        let sel = SPSelection<SPSymbol>(systemName: "star.fill", colorValues: nil as [Double]?)
        #expect(sel.type == .symbol)
        #expect(sel.color == nil)
    }

    @Test("init(systemName:colorValues:) with empty array creates symbol without color")
    func testInitSystemNameColorValuesEmpty() {
        let sel = SPSelection<SPSymbol>(systemName: "star.fill", colorValues: [])
        #expect(sel.type == .symbol)
        #expect(sel.color == nil)
    }

    @Test("init(systemName:colorValues:) with wrong count creates symbol without color")
    func testInitSystemNameColorValuesWrongCount() {
        let sel = SPSelection<SPSymbol>(systemName: "star.fill", colorValues: [1.0])
        #expect(sel.type == .symbol)
        #expect(sel.color == nil)
    }

    // MARK: - init(emoji:color:Color?) — safe branches only

    @Test("init(emoji:color:Color?) with nil creates emoji without color")
    func testInitEmojiNilColor() {
        let emoji = SPEmoji("1F600")
        let sel = SPSelection<SPSymbol>(emoji: emoji, color: nil as Color?)
        #expect(sel.type == .emoji)
        #expect(sel.color == nil)
    }

    // MARK: - init(emoji:colorValues:[Double]?) — safe branches only

    @Test("init(emoji:colorValues:) with nil creates emoji without color")
    func testInitEmojiColorValuesNil() {
        let emoji = SPEmoji("1F600")
        let sel = SPSelection<SPSymbol>(emoji: emoji, colorValues: nil as [Double]?)
        #expect(sel.type == .emoji)
        #expect(sel.color == nil)
    }

    @Test("init(emoji:colorValues:) with empty array creates emoji without color")
    func testInitEmojiColorValuesEmpty() {
        let emoji = SPEmoji("1F600")
        let sel = SPSelection<SPSymbol>(emoji: emoji, colorValues: [])
        #expect(sel.type == .emoji)
        #expect(sel.color == nil)
    }

    @Test("init(emoji:colorValues:) with wrong count creates emoji without color")
    func testInitEmojiColorValuesWrongCount() {
        let emoji = SPEmoji("1F600")
        let sel = SPSelection<SPSymbol>(emoji: emoji, colorValues: [0.5])
        #expect(sel.type == .emoji)
        #expect(sel.color == nil)
    }

    // MARK: - init(image:color:Color?) — safe branches only

    @Test("init(image:color:Color?) with nil creates image without color")
    func testInitImageNilColor() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let sel = SPSelection<SPSymbol>(image: image, color: nil as Color?)
        #expect(sel.type == .image)
        #expect(sel.color == nil)
    }

    // MARK: - init(image:colorValues:[Double]?) — safe branches only

    @Test("init(image:colorValues:) with nil creates image without color")
    func testInitImageColorValuesNil() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let sel = SPSelection<SPSymbol>(image: image, colorValues: nil as [Double]?)
        #expect(sel.type == .image)
        #expect(sel.color == nil)
    }

    @Test("init(image:colorValues:) with empty creates image without color")
    func testInitImageColorValuesEmpty() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let sel = SPSelection<SPSymbol>(image: image, colorValues: [])
        #expect(sel.type == .image)
        #expect(sel.color == nil)
    }

    @Test("init(image:colorValues:) with wrong count creates image without color")
    func testInitImageColorValuesWrongCount() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let sel = SPSelection<SPSymbol>(image: image, colorValues: [0.5])
        #expect(sel.type == .image)
        #expect(sel.color == nil)
    }

    // MARK: - Codable init(from decoder:) — image and color types

    @Test("init(from decoder:) round-trip for .image type")
    func testCodableImageRoundTrip() throws {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let original = SPSelection<SPSymbol>(image: image)
        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(SPSelection<SPSymbol>.self, from: encoded)
        #expect(decoded.type == .image)
        #expect(decoded.image != nil)
    }

    @Test("init(from decoder:) round-trip for .color type")
    func testCodableColorRoundTrip() throws {
        let color = CKColor(red: 0.5, green: 0.5, blue: 0.5, opacity: 1)
        let original = SPSelection<SPSymbol>(value: color)
        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(SPSelection<SPSymbol>.self, from: encoded)
        #expect(decoded.type == .color)
        #expect(decoded.color != nil)
    }

    @Test("init(from decoder:) round-trip preserves tint color for symbol")
    func testCodableSymbolWithTint() throws {
        let symbol = SPSymbol(systemName: "star.fill")
        let color = CKColor(red: 1, green: 0.5, blue: 0, opacity: 1)
        let original = SPSelection(symbol: symbol, color: color)
        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(SPSelection<SPSymbol>.self, from: encoded)
        #expect(decoded.type == .symbol)
        #expect(decoded.color != nil)
    }
}
#endif
