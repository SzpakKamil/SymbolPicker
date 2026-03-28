//
//  SPDataAssetTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// MARK: - SPDataAsset Protocol Tests
//
// SPSymbol overrides both isDuplicate(of:) and isSelection(of:).
// SPEmoji does NOT override them, so it uses the default protocol extension:
//   isDuplicate(of:) -> self == other
//   isSelection(of:) -> self == other

struct SPDataAssetTests {

    // MARK: - SPSymbol.isDuplicate(of:) — custom override

    @Test("SPSymbol isDuplicate: same filledName and notFilled → true")
    func testSymbolIsDuplicateBothMatch() {
        let a = SPSymbol(filledName: "star.fill", notFilled: "star")
        let b = SPSymbol(filledName: "star.fill", notFilled: "star")
        #expect(a.isDuplicate(of: b))
        #expect(b.isDuplicate(of: a))
    }

    @Test("SPSymbol isDuplicate: same filledName different notFilled → false")
    func testSymbolIsDuplicateSameFilledDifferentNotFilled() {
        let a = SPSymbol(filledName: "star.fill", notFilled: "star")
        let b = SPSymbol(filledName: "star.fill", notFilled: "star.circle")
        #expect(!a.isDuplicate(of: b))
    }

    @Test("SPSymbol isDuplicate: different filledName same notFilled → false")
    func testSymbolIsDuplicateDifferentFilledSameNotFilled() {
        let a = SPSymbol(filledName: "star.fill", notFilled: "star")
        let b = SPSymbol(filledName: "heart.fill", notFilled: "star")
        #expect(!a.isDuplicate(of: b))
    }

    @Test("SPSymbol isDuplicate: both different → false")
    func testSymbolIsDuplicateBothDifferent() {
        let a = SPSymbol(filledName: "star.fill", notFilled: "star")
        let b = SPSymbol(filledName: "heart.fill", notFilled: "heart")
        #expect(!a.isDuplicate(of: b))
    }

    @Test("SPSymbol isDuplicate: same symbol via systemName init → true")
    func testSymbolIsDuplicateSystemName() {
        let a = SPSymbol(systemName: "star.fill")
        let b = SPSymbol(systemName: "star.fill")
        #expect(a.isDuplicate(of: b))
    }

    // MARK: - SPSymbol.isSelection(of:) — custom override
    // Logic: self.filledName == other.filledName || self.filledName == other.notFilled

    @Test("SPSymbol isSelection: self.filledName == other.filledName → true")
    func testSymbolIsSelectionMatchesFilledName() {
        let self_ = SPSymbol(filledName: "star.fill", notFilled: "star")
        let other = SPSymbol(filledName: "star.fill", notFilled: "star.circle")
        #expect(self_.isSelection(of: other))
    }

    @Test("SPSymbol isSelection: self.filledName == other.notFilled → true")
    func testSymbolIsSelectionMatchesNotFilled() {
        // self.filledName ("star.fill") == other.notFilled ("star.fill")
        let self_ = SPSymbol(filledName: "star.fill", notFilled: "star")
        let other = SPSymbol(filledName: "heart.fill", notFilled: "star.fill")
        #expect(self_.isSelection(of: other))
    }

    @Test("SPSymbol isSelection: neither matches → false")
    func testSymbolIsSelectionNoMatch() {
        let self_ = SPSymbol(filledName: "star.fill", notFilled: "star")
        let other = SPSymbol(filledName: "heart.fill", notFilled: "heart")
        #expect(!self_.isSelection(of: other))
    }

    @Test("SPSymbol isSelection: same systemName init → true")
    func testSymbolIsSelectionSystemName() {
        let a = SPSymbol(systemName: "star.fill")
        let b = SPSymbol(systemName: "star.fill")
        #expect(a.isSelection(of: b))
    }

    @Test("SPSymbol isSelection is not symmetric when filledName differs")
    func testSymbolIsSelectionAsymmetry() {
        // a.filledName ("star.fill") == b.notFilled ("star.fill") → a.isSelection(of: b) true
        let a = SPSymbol(filledName: "star.fill", notFilled: "star")
        let b = SPSymbol(filledName: "heart.fill", notFilled: "star.fill")
        #expect(a.isSelection(of: b))
        // b.filledName ("heart.fill") == a.filledName ("star.fill") → false
        // b.filledName ("heart.fill") == a.notFilled ("star") → false
        #expect(!b.isSelection(of: a))
    }

    // MARK: - SPEmoji.isDuplicate(of:) — default protocol extension (self == other)

    @Test("SPEmoji isDuplicate: same id and tone → true")
    func testEmojiIsDuplicateSame() {
        let a = SPEmoji(id: "1F600", version: 1.0, tone: 0)
        let b = SPEmoji(id: "1F600", version: 1.0, tone: 0)
        #expect(a.isDuplicate(of: b))
    }

    @Test("SPEmoji isDuplicate: same id different tone → false")
    func testEmojiIsDuplicateDifferentTone() {
        let a = SPEmoji(id: "1F44B", version: 1.0, tone: 0)
        let b = SPEmoji(id: "1F44B", version: 1.0, tone: 1)
        #expect(!a.isDuplicate(of: b))
    }

    @Test("SPEmoji isDuplicate: different id → false")
    func testEmojiIsDuplicateDifferentId() {
        let a = SPEmoji(id: "1F600", version: 1.0)
        let b = SPEmoji(id: "1F601", version: 1.0)
        #expect(!a.isDuplicate(of: b))
    }

    // MARK: - SPEmoji.isSelection(of:) — default protocol extension (self == other)

    @Test("SPEmoji isSelection: same id and tone → true")
    func testEmojiIsSelectionSame() {
        let a = SPEmoji(id: "1F600", version: 1.0, tone: 0)
        let b = SPEmoji(id: "1F600", version: 1.0, tone: 0)
        #expect(a.isSelection(of: b))
        #expect(b.isSelection(of: a))
    }

    @Test("SPEmoji isSelection: different id → false")
    func testEmojiIsSelectionDifferentId() {
        let a = SPEmoji(id: "1F600", version: 1.0)
        let b = SPEmoji(id: "1F601", version: 1.0)
        #expect(!a.isSelection(of: b))
    }

    @Test("SPEmoji isSelection: same id different tone → false")
    func testEmojiIsSelectionDifferentTone() {
        let a = SPEmoji(id: "1F44B", version: 1.0, tone: 0)
        let b = SPEmoji(id: "1F44B", version: 1.0, tone: 2)
        #expect(!a.isSelection(of: b))
    }

    // MARK: - SPDataAsset default matches(_:) via SPSymbol

    @Test("SPDataAsset matches: empty text always returns false via all-nil fields")
    func testMatchesEmptyText() {
        let symbol = SPSymbol(systemName: "star.fill")
        // annotation, category, subcategory, tags are all nil
        // tags?.filter{}.isEmpty == false → false (tags is nil)
        // annotation?.contains → false (nil)
        // etc.
        #expect(!symbol.matches("anything"))
    }

    @Test("SPDataAsset matches: tag match is case-sensitive")
    func testMatchesTagCaseSensitive() {
        let symbol = SPSymbol(filledName: "s", notFilled: "s", tags: ["star"])
        #expect(symbol.matches("star"))
        #expect(!symbol.matches("Star"))
        #expect(!symbol.matches("STAR"))
    }

    @Test("SPDataAsset matches: annotation match is case-insensitive via localizedStandardContains")
    func testMatchesAnnotationCaseInsensitive() {
        let symbol = SPSymbol(filledName: "s", notFilled: "s", annotation: "Bright Star")
        #expect(symbol.matches("bright"))
        #expect(symbol.matches("BRIGHT"))
        #expect(symbol.matches("Bright"))
    }
}
#endif
