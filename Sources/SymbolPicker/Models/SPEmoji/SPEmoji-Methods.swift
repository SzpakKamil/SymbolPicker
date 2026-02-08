//
//  SPEmoji-Methods.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI
import CoreText

extension SPEmoji{
    public func isAvailable() -> Bool{
        let emoji = SPEmoji.emojiString(fromHexcode: id)
        guard !emoji.isEmpty else {
            return false
        }
        return SPEmoji.isEmojiRenderable(emoji)
    }
    
    public func emojiString() -> String{
        if tone == 0 {
            return Self.emojiString(fromHexcode: id)
        }
        let index = tone - 1
        if let skins, skins.indices.contains(index) {
            return Self.emojiString(fromHexcode: skins[index].id)
        }
        return Self.emojiString(fromHexcode: id)
    }
    
    static let filePrefix: String = "emojis"
    
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
