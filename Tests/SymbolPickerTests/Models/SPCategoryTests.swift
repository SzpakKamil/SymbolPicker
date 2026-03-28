//
//  SPCategoryTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPCategoryTests {

    private func makeCategory(_ name: String, symbols: [SPSymbol] = []) -> SPCategory<SPSymbol> {
        SPCategory(category: name, elements: symbols)
    }

    // MARK: - Identifiable

    @Test("SPCategory Identifiable uses category as id")
    func testIdentifiable() {
        let category = makeCategory("nature")
        #expect(category.id == "nature")
    }

    // MARK: - Equatable

    @Test("SPCategory Equatable same category and elements")
    func testEquatableSame() {
        let a = makeCategory("nature")
        let b = makeCategory("nature")
        #expect(a == b)
    }

    @Test("SPCategory Equatable different category")
    func testEquatableDifferentCategory() {
        let a = makeCategory("nature")
        let b = makeCategory("weather")
        #expect(a != b)
    }

    @Test("SPCategory Equatable different elements")
    func testEquatableDifferentElements() {
        let a = makeCategory("nature", symbols: [SPSymbol(systemName: "star.fill")])
        let b = makeCategory("nature", symbols: [SPSymbol(systemName: "heart.fill")])
        #expect(a != b)
    }

    // MARK: - Comparable

    @Test("SPCategory Comparable uses alphabetical order")
    func testComparable() {
        let animals = makeCategory("animals")
        let nature = makeCategory("nature")
        let weather = makeCategory("weather")

        #expect(animals < nature)
        #expect(nature < weather)
        #expect(!(weather < animals))
    }

    // MARK: - Elements

    @Test("SPCategory stores elements correctly")
    func testElements() {
        let symbols = [SPSymbol(systemName: "star.fill"), SPSymbol(systemName: "heart.fill")]
        let category = makeCategory("misc", symbols: symbols)
        #expect(category.elements.count == 2)
        #expect(category.elements[0].id == "star.fill")
        #expect(category.elements[1].id == "heart.fill")
    }

    @Test("SPCategory with empty elements")
    func testEmptyElements() {
        let category = makeCategory("empty")
        #expect(category.elements.isEmpty)
    }
}
#endif
