//
//  SPEmojiSkin-Base.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

extension SPEmoji{
    public nonisolated struct Skin: Identifiable, Sendable  {
        public let id: String
        public let annotation: String?
        public let version: Double
        
        init(id: String, annotation: String? = nil, version: Double) {
            self.id = id
            self.annotation = annotation
            self.version = version
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
