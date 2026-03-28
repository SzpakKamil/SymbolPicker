//
//  SPEmojiFetchTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPEmojiFetchTests {

    // MARK: - isAvailable (instance)

    @Test("SPEmoji isAvailable returns true for common emoji with low version")
    func testIsAvailableLowVersion() {
        // version 1.0 maps to OS 10.0 minimum → always available on any supported device
        let emoji = SPEmoji(id: "1F600", version: 1.0)
        #expect(emoji.isAvailable())
    }

    @Test("SPEmoji isAvailable returns false for invalid hexcode")
    func testIsAvailableInvalidHexcode() {
        // "ZZZZZZ" is not valid hex → emojiString is empty → false
        let emoji = SPEmoji(id: "ZZZZZZ", version: 1.0)
        #expect(!emoji.isAvailable())
    }

    @Test("SPEmoji isAvailable returns false for empty hexcode")
    func testIsAvailableEmptyHexcode() {
        let emoji = SPEmoji(id: "", version: 1.0)
        #expect(!emoji.isAvailable())
    }

    @Test("SPEmoji isAvailable checks renderable via isEmojiRenderable")
    func testIsAvailableRenderable() {
        // 1F44D = thumbs up, version 1.0 — should be renderable on all test platforms
        let emoji = SPEmoji(id: "1F44D", version: 1.0)
        let renderable = SPEmoji.isEmojiRenderable(emoji.emojiString())
        #expect(emoji.isAvailable() == renderable)
    }

    // MARK: - init(from decoder:) — Codable initializer

    @Test("SPEmoji init(from decoder:) decodes required hexcode field")
    func testInitFromDecoderMinimal() throws {
        let json = "{\"hexcode\": \"1F600\"}"
        let emoji = try JSONDecoder().decode(SPEmoji.self, from: Data(json.utf8))
        #expect(emoji.id == "1F600")
        #expect(emoji.version == 0)
        #expect(emoji.tone == 0)
        #expect(emoji.category == nil)
        #expect(emoji.annotation == nil)
        #expect(emoji.skins == nil)
    }

    @Test("SPEmoji init(from decoder:) decodes all optional fields when present")
    func testInitFromDecoderAllFields() throws {
        let json = """
        {
            "hexcode": "1F600",
            "version": 13.0,
            "category": "Smileys",
            "annotation": "grinning face",
            "subcategory": "face-smiling",
            "tags": ["happy", "smile"],
            "tone": 2
        }
        """
        let emoji = try JSONDecoder().decode(SPEmoji.self, from: Data(json.utf8))
        #expect(emoji.id == "1F600")
        #expect(emoji.version == 13.0)
        #expect(emoji.category == "Smileys")
        #expect(emoji.annotation == "grinning face")
        #expect(emoji.subcategory == "face-smiling")
        #expect(emoji.tags == ["happy", "smile"])
        #expect(emoji.tone == 2)
    }

    @Test("SPEmoji init(from decoder:) version defaults to 0 when absent")
    func testInitFromDecoderVersionDefault() throws {
        let json = "{\"hexcode\": \"1F600\"}"
        let emoji = try JSONDecoder().decode(SPEmoji.self, from: Data(json.utf8))
        #expect(emoji.version == 0)
    }

    @Test("SPEmoji init(from decoder:) tone defaults to 0 when absent")
    func testInitFromDecoderToneDefault() throws {
        let json = "{\"hexcode\": \"1F600\"}"
        let emoji = try JSONDecoder().decode(SPEmoji.self, from: Data(json.utf8))
        #expect(emoji.tone == 0)
    }

    @Test("SPEmoji init(from decoder:) decodes skins array")
    func testInitFromDecoderWithSkins() throws {
        let json = """
        {
            "hexcode": "1F44B",
            "version": 1.0,
            "skins": [
                {"hexcode": "1F44B-1F3FB", "version": 1.0},
                {"hexcode": "1F44B-1F3FC", "version": 1.0}
            ]
        }
        """
        let emoji = try JSONDecoder().decode(SPEmoji.self, from: Data(json.utf8))
        let skins = try #require(emoji.skins)
        #expect(skins.count == 2)
        #expect(skins[0].id == "1F44B-1F3FB")
        #expect(skins[1].id == "1F44B-1F3FC")
    }

    @Test("SPEmoji init(from decoder:) rejects missing required hexcode field")
    func testInitFromDecoderMissingHexcode() {
        let json = "{\"version\": 1.0}"
        #expect(throws: (any Error).self) {
            try JSONDecoder().decode(SPEmoji.self, from: Data(json.utf8))
        }
    }

    // MARK: - fetchAssets

    @Test("SPEmoji fetchAssets returns non-empty list for 'en' locale")
    func testFetchAssetsEnglish() async throws {
        let emojis = try await SPEmoji.fetchAssets(locale: "en")
        #expect(!emojis.isEmpty)
    }

    @Test("SPEmoji fetchAssets all returned emojis have non-empty id")
    func testFetchAssetsNonEmptyIds() async throws {
        let emojis = try await SPEmoji.fetchAssets(locale: "en")
        #expect(emojis.allSatisfy { !$0.id.isEmpty })
    }

    @Test("SPEmoji fetchAssets all returned emojis pass isAvailable")
    func testFetchAssetsAllAvailable() async throws {
        let emojis = try await SPEmoji.fetchAssets(locale: "en")
        #expect(emojis.allSatisfy { $0.isAvailable() })
    }

    @Test("SPEmoji fetchAssets falls back to 'en' for unknown locale")
    func testFetchAssetsFallbackLocale() async throws {
        let emojis = try await SPEmoji.fetchAssets(locale: "xx-unknown")
        #expect(!emojis.isEmpty)
    }

    @Test("SPEmoji fetchAssets locale 'de' returns non-empty list")
    func testFetchAssetsGermanLocale() async throws {
        let emojis = try await SPEmoji.fetchAssets(locale: "de")
        #expect(!emojis.isEmpty)
    }

    @Test("SPEmoji fetchAssets result contains no duplicate ids with same tone")
    func testFetchAssetsNoDuplicates() async throws {
        let emojis = try await SPEmoji.fetchAssets(locale: "en")
        let ids = emojis.map { "\($0.id)_\($0.tone)" }
        #expect(ids.count == Set(ids).count)
    }
}
#endif
