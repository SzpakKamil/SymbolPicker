//
//  RemoveDuplicatesTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct RemoveDuplicatesTests {

    @Test("removeDuplicates removes duplicate elements")
    func testRemovesDuplicates() {
        let array = [1, 2, 2, 3, 3, 3, 4]
        let result = array.removeDuplicates()
        #expect(result == [1, 2, 3, 4])
    }

    @Test("removeDuplicates preserves first occurrence order")
    func testPreservesOrder() {
        let array = [3, 1, 2, 1, 3]
        let result = array.removeDuplicates()
        #expect(result == [3, 1, 2])
    }

    @Test("removeDuplicates with empty array returns empty")
    func testEmptyArray() {
        let array: [Int] = []
        #expect(array.removeDuplicates().isEmpty)
    }

    @Test("removeDuplicates with all unique elements returns same order")
    func testAllUnique() {
        let array = [1, 2, 3, 4, 5]
        #expect(array.removeDuplicates() == [1, 2, 3, 4, 5])
    }

    @Test("removeDuplicates with single element")
    func testSingleElement() {
        let array = [42]
        #expect(array.removeDuplicates() == [42])
    }

    @Test("removeDuplicates with custom predicate")
    func testCustomPredicate() {
        let array = ["hello", "Hello", "HELLO", "world"]
        let result = array.removeDuplicates(where: { $0.lowercased() == $1.lowercased() })
        #expect(result == ["hello", "world"])
    }

    @Test("removeDuplicates works with SPSymbol via isDuplicate")
    func testWithSPSymbolDuplicate() {
        let star1 = SPSymbol(filledName: "star.fill", notFilled: "star")
        let star2 = SPSymbol(filledName: "star.fill", notFilled: "star")
        let heart = SPSymbol(filledName: "heart.fill", notFilled: "heart")
        let array = [star1, star2, heart]
        let result = array.removeDuplicates(where: { $0.isDuplicate(of: $1) })
        #expect(result.count == 2)
        #expect(result[0].filledName == "star.fill")
        #expect(result[1].filledName == "heart.fill")
    }
}
#endif
