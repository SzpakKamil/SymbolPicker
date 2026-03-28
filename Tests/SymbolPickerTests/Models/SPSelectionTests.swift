//
//  SPSelectionTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
import ColorKit
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPSelectionTests {

    // MARK: - Initializers

    @Test("SPSelection init with symbol sets type and symbol")
    func testInitWithSymbol() {
        let symbol = SPSymbol(systemName: "star.fill")
        let selection = SPSelection(symbol: symbol)
        #expect(selection.type == .symbol)
        #expect(selection.symbol?.id == symbol.id)
        #expect(selection.emoji == nil)
        #expect(selection.image == nil)
        #expect(selection.color == nil)
    }

    @Test("SPSelection init with systemName creates symbol selection")
    func testInitWithSystemName() {
        let selection = SPSelection<SPSymbol>(systemName: "star.fill")
        #expect(selection.type == .symbol)
        #expect(selection.symbol?.filledName == "star.fill")
        #expect(selection.symbol?.notFilled == "star.fill")
    }

    @Test("SPSelection init with emoji sets type and emoji")
    func testInitWithEmoji() {
        let emoji = SPEmoji("1F600")
        let selection = SPSelection<SPSymbol>(emoji: emoji)
        #expect(selection.type == .emoji)
        #expect(selection.emoji?.id == "1F600")
        #expect(selection.symbol == nil)
        #expect(selection.image == nil)
    }

    @Test("SPSelection init with color sets type and color")
    func testInitWithColor() {
        let color = CKColor(red: 1, green: 0, blue: 0, opacity: 1)
        let selection = SPSelection<SPSymbol>(value: color)
        #expect(selection.type == .color)
        #expect(selection.color != nil)
        #expect(selection.symbol == nil)
        #expect(selection.emoji == nil)
    }

    @Test("SPSelection init with symbol and color sets both")
    func testInitWithSymbolAndColor() {
        let symbol = SPSymbol(systemName: "star.fill")
        let color = CKColor(red: 1, green: 0, blue: 0, opacity: 1)
        let selection = SPSelection(symbol: symbol, color: color)
        #expect(selection.type == .symbol)
        #expect(selection.color != nil)
    }

    // MARK: - Mutating setters

    @Test("SPSelection setSymbol updates type and clears emoji and image")
    func testSetSymbol() {
        let emoji = SPEmoji("1F600")
        var selection = SPSelection<SPSymbol>(emoji: emoji)
        let symbol = SPSymbol(systemName: "star.fill")
        selection.setSymbol(symbol)
        #expect(selection.type == .symbol)
        #expect(selection.symbol?.id == symbol.id)
        #expect(selection.emoji == nil)
        #expect(selection.image == nil)
    }

    @Test("SPSelection setEmoji updates type and clears symbol and image")
    func testSetEmoji() {
        let symbol = SPSymbol(systemName: "star.fill")
        var selection = SPSelection(symbol: symbol)
        let emoji = SPEmoji("1F600")
        selection.setEmoji(emoji)
        #expect(selection.type == .emoji)
        #expect(selection.emoji?.id == "1F600")
        #expect(selection.symbol == nil)
        #expect(selection.image == nil)
    }

    @Test("SPSelection setColor updates color without changing type")
    func testSetColor() {
        let symbol = SPSymbol(systemName: "star.fill")
        var selection = SPSelection(symbol: symbol)
        let color = CKColor(red: 0, green: 0, blue: 1, opacity: 1)
        selection.setColor(color)
        #expect(selection.type == .symbol)
        #expect(selection.getColor() != nil)
    }

    // MARK: - Getters

    @Test("SPSelection getters return correct values")
    func testGetters() {
        let symbol = SPSymbol(systemName: "star.fill")
        let color = CKColor(red: 1, green: 0, blue: 0, opacity: 1)
        let selection = SPSelection(symbol: symbol, color: color)
        #expect(selection.getSymbol()?.id == symbol.id)
        #expect(selection.getColor() != nil)
        #expect(selection.getEmoji() == nil)
        #expect(selection.getImage() == nil)
    }

    // MARK: - id format

    @Test("SPSelection id has symbol prefix for symbol type")
    func testIdFormatSymbol() {
        let symbol = SPSymbol(systemName: "star.fill")
        let selection = SPSelection(symbol: symbol)
        #expect(selection.id.hasPrefix("symbol:"))
    }

    @Test("SPSelection id has emoji prefix and contains hexcode for emoji type")
    func testIdFormatEmoji() {
        let emoji = SPEmoji("1F600")
        let selection = SPSelection<SPSymbol>(emoji: emoji)
        #expect(selection.id.hasPrefix("emoji:"))
        #expect(selection.id.contains("1F600"))
    }

    @Test("SPSelection id has image prefix for image type")
    func testIdFormatImage() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let selection = SPSelection<SPSymbol>(image: image)
        #expect(selection.id.hasPrefix("image:"))
    }

    @Test("SPSelection id has color prefix for color type")
    func testIdFormatColor() {
        let color = CKColor(red: 1, green: 0, blue: 0, opacity: 1)
        let selection = SPSelection<SPSymbol>(value: color)
        #expect(selection.id.hasPrefix("color:"))
    }

    // MARK: - Equatable & Hashable

    @Test("SPSelection Equatable")
    func testEquatable() {
        let symbol = SPSymbol(systemName: "star.fill")
        let a = SPSelection(symbol: symbol)
        let b = SPSelection(symbol: symbol)
        #expect(a == b)
    }

    @Test("SPSelection Hashable")
    func testHashable() {
        let symbol = SPSymbol(systemName: "star.fill")
        let s1 = SPSelection(symbol: symbol)
        let s2 = SPSelection(symbol: symbol)
        let emoji = SPEmoji("1F600")
        let s3 = SPSelection<SPSymbol>(emoji: emoji)
        let set: Set<SPSelection<SPSymbol>> = [s1, s2, s3]
        #expect(set.count == 2)
    }

    // MARK: - Codable

    @Test("SPSelection Codable round-trip with symbol")
    func testCodableWithSymbol() throws {
        let symbol = SPSymbol(systemName: "star.fill")
        let original = SPSelection(symbol: symbol)
        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(SPSelection<SPSymbol>.self, from: encoded)
        #expect(decoded.type == .symbol)
        #expect(decoded.symbol?.filledName == "star.fill")
    }

    @Test("SPSelection Codable round-trip with emoji")
    func testCodableWithEmoji() throws {
        let emoji = SPEmoji(id: "1F600", version: 1.0)
        let original = SPSelection<SPSymbol>(emoji: emoji)
        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(SPSelection<SPSymbol>.self, from: encoded)
        #expect(decoded.type == .emoji)
        #expect(decoded.emoji?.id == "1F600")
    }

    @Test("SPSelection SelectionType Codable round-trip")
    func testSelectionTypeCodable() throws {
        let types: [SPSelection<SPSymbol>.SelectionType] = [.symbol, .emoji, .image, .color]
        for type_ in types {
            let encoded = try JSONEncoder().encode(type_)
            let decoded = try JSONDecoder().decode(SPSelection<SPSymbol>.SelectionType.self, from: encoded)
            #expect(decoded == type_)
        }
    }
}
#endif
