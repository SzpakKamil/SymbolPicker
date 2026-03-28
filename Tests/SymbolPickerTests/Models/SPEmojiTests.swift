//
//  SPEmojiTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPEmojiTests {

    // MARK: - Initializers

    @Test("SPEmoji init from emoji string converts to hexcode")
    func testInitFromEmojiString() {
        let emoji = SPEmoji("😀")
        #expect(emoji.id == "1F600")
    }

    @Test("SPEmoji init from hexcode stays as hexcode")
    func testInitFromHexcode() {
        let emoji = SPEmoji("1F600")
        #expect(emoji.id == "1F600")
    }

    @Test("SPEmoji init from multi-codepoint emoji")
    func testInitFromMultiCodepointEmoji() {
        let emoji = SPEmoji("👨‍👩‍👧")
        #expect(!emoji.id.isEmpty)
        #expect(emoji.id.contains("-"))
    }

    @Test("SPEmoji default properties")
    func testDefaultProperties() {
        let emoji = SPEmoji("1F600")
        #expect(emoji.version == 1.0)
        #expect(emoji.category == nil)
        #expect(emoji.annotation == nil)
        #expect(emoji.tone == 0)
        #expect(emoji.skins == nil)
    }

    // MARK: - emojiString

    @Test("SPEmoji emojiString converts hexcode back to emoji")
    func testEmojiStringFromHexcode() {
        let emoji = SPEmoji("1F600")
        #expect(emoji.emojiString() == "😀")
    }

    @Test("SPEmoji emojiString with tone 0 uses base id")
    func testEmojiStringToneZero() {
        let emoji = SPEmoji(id: "1F44B", version: 1.0, tone: 0)
        #expect(emoji.emojiString() == "👋")
    }

    @Test("SPEmoji emojiString with skin uses skin id")
    func testEmojiStringWithSkin() {
        let skin = SPEmoji.Skin(id: "1F44B-1F3FB", version: 1.0)
        let emoji = SPEmoji(id: "1F44B", version: 1.0, skins: [skin], tone: 1)
        let result = emoji.emojiString()
        #expect(!result.isEmpty)
    }

    // MARK: - isEmojiRenderable

    @Test("SPEmoji isEmojiRenderable for common emoji")
    func testIsEmojiRenderableTrue() {
        #expect(SPEmoji.isEmojiRenderable("😀"))
        #expect(SPEmoji.isEmojiRenderable("👋"))
        #expect(SPEmoji.isEmojiRenderable("❤️"))
    }

    @Test("SPEmoji isEmojiRenderable returns false for empty string")
    func testIsEmojiRenderableEmpty() {
        #expect(!SPEmoji.isEmojiRenderable(""))
    }

    // MARK: - Equatable & Hashable

    @Test("SPEmoji Equatable")
    func testEquatable() {
        let a = SPEmoji("1F600")
        let b = SPEmoji("1F600")
        let c = SPEmoji("1F601")
        #expect(a == b)
        #expect(a != c)
    }

    @Test("SPEmoji Hashable")
    func testHashable() {
        let set: Set<SPEmoji> = [SPEmoji("1F600"), SPEmoji("1F600"), SPEmoji("1F601")]
        #expect(set.count == 2)
    }

    // MARK: - Codable

    @Test("SPEmoji Codable round-trip")
    func testCodable() throws {
        let original = SPEmoji(id: "1F600", version: 13.0, category: "Smileys & Emotion", annotation: "grinning face", subcategory: "face-smiling", tags: ["grin", "face"])
        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(SPEmoji.self, from: encoded)

        #expect(decoded.id == original.id)
        #expect(decoded.version == original.version)
        #expect(decoded.category == original.category)
        #expect(decoded.annotation == original.annotation)
        #expect(decoded.subcategory == original.subcategory)
        #expect(decoded.tags == original.tags)
    }

    // MARK: - Skin

    @Test("SPEmoji.Skin Codable round-trip")
    func testSkinCodable() throws {
        let skin = SPEmoji.Skin(id: "1F44B-1F3FB", annotation: "waving hand light skin", version: 1.0)
        let encoded = try JSONEncoder().encode(skin)
        let decoded = try JSONDecoder().decode(SPEmoji.Skin.self, from: encoded)

        #expect(decoded.id == skin.id)
        #expect(decoded.annotation == skin.annotation)
        #expect(decoded.version == skin.version)
    }

    @Test("SPEmoji.Skin emojiString returns non-empty string")
    func testSkinEmojiString() {
        let skin = SPEmoji.Skin(id: "1F44B", version: 1.0)
        #expect(!skin.emojiString().isEmpty)
    }

    @Test("SPEmoji.Skin Equatable uses id")
    func testSkinEquatable() {
        let a = SPEmoji.Skin(id: "1F44B-1F3FB", version: 1.0)
        let b = SPEmoji.Skin(id: "1F44B-1F3FB", version: 2.0)
        let c = SPEmoji.Skin(id: "1F44B-1F3FC", version: 1.0)
        #expect(a == b)
        #expect(a != c)
    }

    @Test("SPEmoji.Skin Hashable uses id")
    func testSkinHashable() {
        let a = SPEmoji.Skin(id: "1F44B-1F3FB", version: 1.0)
        let b = SPEmoji.Skin(id: "1F44B-1F3FB", version: 1.0)
        let c = SPEmoji.Skin(id: "1F44B-1F3FC", version: 1.0)
        let set: Set<SPEmoji.Skin> = [a, b, c]
        #expect(set.count == 2)
    }
}
#endif
