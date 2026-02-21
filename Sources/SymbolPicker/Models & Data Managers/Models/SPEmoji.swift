//
//  SPEmoji.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI
import CoreText

public nonisolated struct SPEmoji: Identifiable, Sendable, SPDataAsset {
    public let id: String
    public let annotation: String?
    public let version: Double
    public let category: String?
    public let subcategory: String?
    public let tags: [String]?
    public let skins: [Skin]?
    public var tone: Int = 0
    
    init(id: String, version: Double, category: String? = nil, annotation: String? = nil, subcategory: String? = nil, tags: [String]? = nil, skins: [Skin]? = nil, tone: Int = 0) {
        self.id = id
        self.version = version
        self.category = category
        self.subcategory = subcategory
        self.annotation = annotation
        self.tags = tags
        self.skins = skins
        self.tone = tone
    }
}

// MARK: - Codable
extension SPEmoji: Codable {
    @_documentation(visibility: internal)
    enum CodingKeys: CodingKey {
        case annotation
        case hexcode
        case version
        case category
        case subcategory
        case tags
        case skins
        case tone
    }
    
    @_documentation(visibility: internal)
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let hexcode = try container.decode(String.self, forKey: .hexcode)
        let version = try container.decodeIfPresent(Double.self, forKey: .version) ?? 0
        let category = try container.decodeIfPresent(String.self, forKey: .category)
        let annotation = try container.decodeIfPresent(String.self, forKey: .annotation)
        let subcategory = try container.decodeIfPresent(String.self, forKey: .subcategory)
        let tags = try container.decodeIfPresent([String].self, forKey: .tags)
        let skins = try container.decodeIfPresent([Skin].self, forKey: .skins)
        let tone = try container.decodeIfPresent(Int.self, forKey: .tone) ?? 0
        
        self.init(
            id: hexcode,
            version: version,
            category: category,
            annotation: annotation,
            subcategory: subcategory,
            tags: tags,
            skins: skins,
            tone: tone
        )
    }
    
    @_documentation(visibility: internal)
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .hexcode)
        try container.encode(version, forKey: .version)
        try container.encodeIfPresent(category, forKey: .category)
        try container.encodeIfPresent(annotation, forKey: .annotation)
        try container.encodeIfPresent(subcategory, forKey: .subcategory)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(skins, forKey: .skins)
        try container.encode(tone, forKey: .tone)
    }
}

// MARK: - Equatable
extension SPEmoji: Equatable {}

// MARK: - Hashable
extension SPEmoji: Hashable {
    @_documentation(visibility: internal)
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(tone)
    }
}

// MARK: - Methods
extension SPEmoji {
    
    /// Determines if this emoji can be displayed on the current device.
    public func isAvailable() -> Bool {
        return SPEmoji.isAvailable(version: self.version, id: self.id)
    }
    
    /// Checks availability for any emoji version and ID.
    static func isAvailable(version: Double, id: String) -> Bool {
        // 1. OS Version Check (Fast)
        guard isUnicodeVersionSupported(version) else { return false }
        
        // 2. Render Capability Check (Slow)
        let emojiString = SPEmoji.emojiString(fromHexcode: id)
        guard !emojiString.isEmpty else { return false }
        
        return SPEmoji.isEmojiRenderable(emojiString)
    }
    
    /// Checks if the current operating system meets the minimum requirements for this emoji's version.
    private static func isUnicodeVersionSupported(_ version: Double) -> Bool {
        let requiredOS = SPEmoji.minimumOSVersion(for: version)
        return ProcessInfo.processInfo.isOperatingSystemAtLeast(requiredOS)
    }
    
    public func emojiString() -> String {
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
    
    /// Maps Unicode Versions to specific Apple OS Releases.
    /// Source: Official Apple Release Notes & Emojipedia.
    private static func minimumOSVersion(for unicodeVersion: Double) -> OperatingSystemVersion {
        let ancient = OperatingSystemVersion(majorVersion: 10, minorVersion: 0, patchVersion: 0)
        
        #if os(iOS) || os(tvOS)
        switch unicodeVersion {
        case 15.1...: return OperatingSystemVersion(majorVersion: 17, minorVersion: 4, patchVersion: 0)
        case 15.0...: return OperatingSystemVersion(majorVersion: 16, minorVersion: 4, patchVersion: 0)
        case 14.0...: return OperatingSystemVersion(majorVersion: 15, minorVersion: 4, patchVersion: 0)
        case 13.1...: return OperatingSystemVersion(majorVersion: 14, minorVersion: 5, patchVersion: 0)
        case 13.0...: return OperatingSystemVersion(majorVersion: 14, minorVersion: 2, patchVersion: 0)
        case 12.0...: return OperatingSystemVersion(majorVersion: 13, minorVersion: 2, patchVersion: 0)
        default:      return ancient
        }
        
        #elseif os(macOS)
        switch unicodeVersion {
        case 15.1...: return OperatingSystemVersion(majorVersion: 14, minorVersion: 4, patchVersion: 0)
        case 15.0...: return OperatingSystemVersion(majorVersion: 13, minorVersion: 3, patchVersion: 0)
        case 14.0...: return OperatingSystemVersion(majorVersion: 12, minorVersion: 3, patchVersion: 0)
        case 13.1...: return OperatingSystemVersion(majorVersion: 11, minorVersion: 3, patchVersion: 0)
        case 13.0...: return OperatingSystemVersion(majorVersion: 11, minorVersion: 0, patchVersion: 0)
        case 12.0...: return OperatingSystemVersion(majorVersion: 10, minorVersion: 15, patchVersion: 1)
        default:      return ancient
        }
        
        #elseif os(watchOS)
        switch unicodeVersion {
        case 15.1...: return OperatingSystemVersion(majorVersion: 10, minorVersion: 4, patchVersion: 0)
        case 15.0...: return OperatingSystemVersion(majorVersion: 9, minorVersion: 4, patchVersion: 0)
        case 14.0...: return OperatingSystemVersion(majorVersion: 8, minorVersion: 5, patchVersion: 0)
        case 13.1...: return OperatingSystemVersion(majorVersion: 7, minorVersion: 4, patchVersion: 0)
        case 13.0...: return OperatingSystemVersion(majorVersion: 7, minorVersion: 1, patchVersion: 0)
        default:      return ancient
        }
        
        #elseif os(visionOS)
        // visionOS 1.0 launched with support for Emoji 15.0.
        // It presumably supports 15.1 in updates, but 1.0 is the safe baseline.
        return OperatingSystemVersion(majorVersion: 1, minorVersion: 0, patchVersion: 0)
        #else
        return ancient
        #endif
    }
    
    private final class AvailabilityCache: @unchecked Sendable {
        private let cache = NSCache<NSString, NSNumber>()

        func value(for key: NSString) -> NSNumber? {
            cache.object(forKey: key)
        }

        func set(_ value: NSNumber, for key: NSString) {
            cache.setObject(value, forKey: key)
        }
    }
    
    private final class EmojiFontBox: @unchecked Sendable {
        let font: CTFont = CTFontCreateWithName("AppleColorEmoji" as CFString, 12, nil)
    }
    
    private static let emojiFontBox = EmojiFontBox()
    // 2. NSCache handles the "Memory Leak" problem by auto-evicting under pressure
    private static let availabilityCache = AvailabilityCache()
    
    static func isEmojiRenderable(_ emoji: String) -> Bool {
        guard !emoji.isEmpty else { return false }
        
        let key = emoji as NSString
        
        // 3. Fast lookup
        if let cached = availabilityCache.value(for: key) {
            return cached.boolValue
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: emojiFontBox.font
        ]
        
        let attributed = NSAttributedString(string: emoji, attributes: attributes)
        let line = CTLineCreateWithAttributedString(attributed)
        let runs = CTLineGetGlyphRuns(line) as NSArray
        
        var result = false
        if runs.count > 0 {
            result = true // Assume true unless a missing glyph (0) is found
            for case let run as CTRun in runs {
                let glyphCount = CTRunGetGlyphCount(run)
                if glyphCount == 0 { continue }
                
                var glyphs = Array(repeating: CGGlyph(), count: glyphCount)
                CTRunGetGlyphs(run, CFRangeMake(0, 0), &glyphs)
                
                if glyphs.contains(0) {
                    result = false
                    break
                }
            }
        }
        
        // 4. Cache the result
        availabilityCache.set(NSNumber(value: result), for: key)
        return result
    }
}


// MARK: - View Component
public struct SPEmojiView: View {
    private let emoji: SPEmoji
    
    public var body: some View {
        if emoji.isAvailable() {
            Text(emoji.emojiString())
                .font(.system(size: 300))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
        } else {
            Text(Image(systemName: "questionmark"))
                .font(.system(size: 300))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
        }
    }
    
    public init(emoji: SPEmoji) {
        self.emoji = emoji
    }
}

public struct SPEmojiSkinView: View {
    private let skin: SPEmoji.Skin
    
    public var body: some View {
        if skin.isAvailable() {
            Text(skin.emojiString())
                .font(.system(size: 300))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
        } else {
            Text(Image(systemName: "questionmark"))
                .font(.system(size: 300))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
        }
    }

    public init(skin: SPEmoji.Skin) {
        self.skin = skin
    }
}
