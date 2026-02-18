//
//  SPEmojiSkin.swift
//  SymbolPicker
//
//  Universal Support: iOS, macOS, watchOS, tvOS, visionOS
//

import SwiftUI
import Foundation

extension SPEmoji {
    /// A lightweight, universally compatible model for emoji skin tone variations.
    public nonisolated struct Skin: Identifiable, Sendable, Codable, Equatable, Hashable {
        
        /// The unique identifier for this skin tone (mapped from 'hexcode').
        public let id: String
        
        /// Optional description (e.g., "Medium-Light Skin Tone").
        public let annotation: String?
        
        /// The Unicode version required to support this skin tone (e.g., 15.0).
        public let version: Double
        
        // MARK: - Initializer
        public init(id: String, annotation: String? = nil, version: Double) {
            self.id = id
            self.annotation = annotation
            self.version = version
        }

        // MARK: - Codable
        enum CodingKeys: String, CodingKey {
            case id = "hexcode"
            case annotation
            case version
        }
        
        public func isAvaiable() -> Bool{
            SPEmoji.isAvailable(version: version, id: id)
        }
        
        public func emojiString() -> String{
            SPEmoji.emojiString(fromHexcode: id)
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decode(String.self, forKey: .id)
            self.annotation = try container.decodeIfPresent(String.self, forKey: .annotation)
            self.version = try container.decodeIfPresent(Double.self, forKey: .version) ?? 0.0
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encodeIfPresent(annotation, forKey: .annotation)
            try container.encode(version, forKey: .version)
        }

        // MARK: - Equatable & Hashable
        public static func ==(lhs: SPEmoji.Skin, rhs: SPEmoji.Skin) -> Bool {
            return lhs.id == rhs.id
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
}
