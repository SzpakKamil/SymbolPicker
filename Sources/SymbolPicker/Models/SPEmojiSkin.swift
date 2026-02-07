//
//  SPEmojiSkin.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI
import CoreText

extension SPEmoji{
    public nonisolated struct Skin: Identifiable, Equatable, Hashable, Codable, Sendable  {
        public let id: String
        public let annotation: String?
        public let version: Double
        
        init(id: String, annotation: String? = nil, version: Double) {
            self.id = id
            self.annotation = annotation
            self.version = version
        }
        
        enum CodingKeys: CodingKey{
            case annotation
            case hexcode
            case version
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let hexcode = try container.decode(String.self, forKey: .hexcode)
            self.id = hexcode
            self.annotation = try container.decodeIfPresent(String.self, forKey: .annotation)
            self.version = try container.decodeIfPresent(Double.self, forKey: .version) ?? 0
            
        }
        public func encode(to encoder: any Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .hexcode)
            try container.encodeIfPresent(annotation, forKey: .annotation)
            try container.encode(version, forKey: .version)
        }
        
        
        public func isAvailable() -> Bool{
            let emoji = SPEmoji.emojiString(fromHexcode: id)
            guard !emoji.isEmpty else {
                return false
            }
            return SPEmoji.isEmojiRenderable(emoji)
        }
    }
}
