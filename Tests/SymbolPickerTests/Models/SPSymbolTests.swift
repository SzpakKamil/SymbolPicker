//
//  SPSymbolTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPSymbolTests {

    // MARK: - Initializers

    @Test("SPSymbol init(systemName:) sets all properties correctly")
    func testSystemNameInit() {
        let symbol = SPSymbol(systemName: "star.fill")
        #expect(symbol.id == "star.fill")
        #expect(symbol.filledName == "star.fill")
        #expect(symbol.notFilled == "star.fill")
        #expect(symbol.version == 1.0)
        #expect(symbol.variant == nil)
        #expect(symbol.annotation == nil)
        #expect(symbol.category == nil)
        #expect(symbol.subcategory == nil)
        #expect(symbol.tags == nil)
    }

    @Test("SPSymbol init(filledName:notFilled:) builds id from names and category")
    func testFullInitId() {
        let symbol = SPSymbol(filledName: "star.fill", notFilled: "star", category: "nature")
        #expect(symbol.id == "star.fillstarnature")
        #expect(symbol.filledName == "star.fill")
        #expect(symbol.notFilled == "star")
        #expect(symbol.category == "nature")
    }

    @Test("SPSymbol init(filledName:notFilled:) with nil category uses none in id")
    func testFullInitNilCategory() {
        let symbol = SPSymbol(filledName: "star.fill", notFilled: "star")
        #expect(symbol.id == "star.fillstarnone")
    }

    // MARK: - Equatable & Hashable

    @Test("SPSymbol Equatable uses id")
    func testEquatable() {
        let a = SPSymbol(systemName: "star.fill")
        let b = SPSymbol(systemName: "star.fill")
        let c = SPSymbol(systemName: "heart.fill")
        #expect(a == b)
        #expect(a != c)
    }

    @Test("SPSymbol Hashable")
    func testHashable() {
        let a = SPSymbol(systemName: "star.fill")
        let b = SPSymbol(systemName: "star.fill")
        let c = SPSymbol(systemName: "heart.fill")
        let set: Set<SPSymbol> = [a, b, c]
        #expect(set.count == 2)
    }

    // MARK: - isSelection & isDuplicate

    @Test("SPSymbol isSelection(of:) matches on filledName or notFilled")
    func testIsSelection() {
        // symbol.filledName = "star.fill", notFilled = "star"
        let symbol = SPSymbol(filledName: "star.fill", notFilled: "star")
        // sameFilledName.filledName = "star.fill" → symbol.filledName == sameFilledName.filledName
        let sameFilledName = SPSymbol(filledName: "star.fill", notFilled: "star.outline")
        // matchesByNotFilled.notFilled = "star.fill" → symbol.filledName == matchesByNotFilled.notFilled
        let matchesByNotFilled = SPSymbol(filledName: "other.fill", notFilled: "star.fill")
        let unrelated = SPSymbol(systemName: "heart.fill")

        #expect(symbol.isSelection(of: sameFilledName))
        #expect(symbol.isSelection(of: matchesByNotFilled))
        #expect(!symbol.isSelection(of: unrelated))
    }

    @Test("SPSymbol isDuplicate(of:) matches on filledName and notFilled")
    func testIsDuplicate() {
        let a = SPSymbol(filledName: "star.fill", notFilled: "star")
        let b = SPSymbol(filledName: "star.fill", notFilled: "star")
        let c = SPSymbol(filledName: "star.fill", notFilled: "star.other")
        #expect(a.isDuplicate(of: b))
        #expect(!a.isDuplicate(of: c))
    }

    // MARK: - Variant

    @Test("SPSymbol name(for:) returns correct name per variant")
    func testNameForVariant() {
        let symbol = SPSymbol(filledName: "star.fill", notFilled: "star")
        #expect(symbol.name(for: .filled) == "star.fill")
        #expect(symbol.name(for: .outlined) == "star")
    }

    @Test("SPSymbol.Variant id values")
    func testVariantId() {
        #expect(SPSymbol.Variant.filled.id == "Filled")
        #expect(SPSymbol.Variant.outlined.id == "Outlined")
    }

    @Test("SPSymbol.Variant Equatable and Hashable")
    func testVariantEquatableHashable() {
        #expect(SPSymbol.Variant.filled == .filled)
        #expect(SPSymbol.Variant.outlined == .outlined)
        #expect(SPSymbol.Variant.filled != .outlined)
        let set: Set<SPSymbol.Variant> = [.filled, .outlined, .filled]
        #expect(set.count == 2)
    }

    // MARK: - matches (SPDataAsset)

    @Test("SPSymbol matches by tag")
    func testMatchesByTag() {
        let symbol = SPSymbol(filledName: "star.fill", notFilled: "star", tags: ["star", "favourite"])
        #expect(symbol.matches("star"))
        #expect(symbol.matches("favourite"))
        #expect(!symbol.matches("cloud"))
    }

    @Test("SPSymbol matches by annotation")
    func testMatchesByAnnotation() {
        let symbol = SPSymbol(filledName: "star.fill", notFilled: "star", annotation: "a bright star")
        #expect(symbol.matches("bright"))
        #expect(!symbol.matches("cloud"))
    }

    @Test("SPSymbol matches by category and subcategory")
    func testMatchesByCategorySubcategory() {
        let symbol = SPSymbol(filledName: "star.fill", notFilled: "star", category: "nature", subcategory: "sky")
        #expect(symbol.matches("nature"))
        #expect(symbol.matches("sky"))
        #expect(!symbol.matches("ocean"))
    }

    // MARK: - Codable

    @Test("SPSymbol Codable round-trip")
    func testCodable() throws {
        let original = SPSymbol(
            filledName: "star.fill",
            notFilled: "star",
            version: 1.5,
            variant: .filled,
            annotation: "bright star",
            category: "nature",
            subcategory: "sky",
            tags: ["star", "bright"]
        )
        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(SPSymbol.self, from: encoded)

        #expect(decoded.filledName == original.filledName)
        #expect(decoded.notFilled == original.notFilled)
        #expect(decoded.version == original.version)
        #expect(decoded.variant == original.variant)
        #expect(decoded.annotation == original.annotation)
        #expect(decoded.category == original.category)
        #expect(decoded.subcategory == original.subcategory)
        #expect(decoded.tags == original.tags)
    }
}
#endif
