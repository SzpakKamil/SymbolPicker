//
//  SPEmoji.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI
import CoreText

public nonisolated struct SPEmoji: Identifiable, Equatable, Hashable, Codable, View, Sendable  {
    public let id: String
    public let version: Double
    public let category: String?
    public let subcategory: String?
    public let tags: [String]?
    public let skins: [Skin]?
    public var tone: Int = 0
    
    
    public func isAvailable() -> Bool{
        let emoji = SPEmoji.emojiString(fromHexcode: id)
        guard !emoji.isEmpty else {
            return false
        }
        return SPEmoji.isEmojiRenderable(emoji)
    }
    
    public var body: some View{
        SPEmojiView(emoji: self)
    }
    init(id: String, version: Double, category: String? = nil, subcategory: String? = nil, tags: [String]? = nil, skins: [Skin]? = nil, tone: Int = 0) {
        self.id = id
        self.version = version
        self.category = category
        self.subcategory = subcategory
        self.tags = tags
        self.skins = skins
        self.tone = tone
    }
    
    enum CodingKeys: CodingKey{
        case annotation
        case hexcode
        case version
        case category
        case subcategory
        case tags
        case skins
        case tone
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let hexcode = try container.decode(String.self, forKey: .hexcode)
        let version = try container.decodeIfPresent(Double.self, forKey: .version) ?? 0
        let category = try container.decodeIfPresent(String.self, forKey: .category)
        let subcategory = try container.decodeIfPresent(String.self, forKey: .subcategory)
        let tags = try container.decodeIfPresent([String].self, forKey: .tags)
        let skins = try container.decodeIfPresent([Skin].self, forKey: .skins)
        let tone = try container.decodeIfPresent(Int.self, forKey: .tone) ?? 0
        
        self.init(
            id: hexcode,
            version: version,
            category: category,
            subcategory: subcategory,
            tags: tags,
            skins: skins,
            tone: tone
        )
    }
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .hexcode)
        try container.encode(version, forKey: .version)
        try container.encodeIfPresent(category, forKey: .category)
        try container.encodeIfPresent(subcategory, forKey: .subcategory)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(skins, forKey: .skins)
        try container.encode(tone, forKey: .tone)
    }
    
    static func emojiString(fromHexcode hexcode: String) -> String {
        let scalars = hexcode
            .split(separator: "-")
            .compactMap { UInt32($0, radix: 16) }
            .compactMap(UnicodeScalar.init)
        return String(String.UnicodeScalarView(scalars))
    }
    
    static func isEmojiRenderable(_ emoji: String) -> Bool {
        guard !emoji.isEmpty else {
            return false
        }

        // ZWJ sequences map to a single glyph, so use CoreText runs instead of per-code-unit mapping.
        let font = CTFontCreateWithName("AppleColorEmoji" as CFString, 0, nil)
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key(kCTFontAttributeName as String): font
        ]
        let attributed = NSAttributedString(string: emoji, attributes: attributes)
        let line = CTLineCreateWithAttributedString(attributed)
        let runs = CTLineGetGlyphRuns(line) as NSArray

        guard runs.count > 0 else {
            return false
        }

        for case let run as CTRun in runs {
            let glyphCount = CTRunGetGlyphCount(run)
            if glyphCount == 0 {
                continue
            }
            var glyphs = Array(repeating: CGGlyph(), count: glyphCount)
            CTRunGetGlyphs(run, CFRangeMake(0, 0), &glyphs)
            if glyphs.contains(0) {
                return false
            }
        }

        return true
    }
}


struct SPEmojiView: View {
    let emoji: SPEmoji
    
    var body: some View {
        Text(SPEmoji.emojiString(fromHexcode: renderedHexcode))
    }
    
    private var renderedHexcode: String {
        if emoji.tone == 0 {
            return emoji.id
        }
        let index = emoji.tone - 1
        if let skins = emoji.skins, skins.indices.contains(index) {
            return skins[index].id
        }
        return emoji.id
    }
}

