//
//  SPEmojiView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

struct SPEmojiView: View {
    private let emoji: SPEmoji
    
    public var body: some View {
        if emoji.isAvailable() {
            Text(emoji.emojiString())
                .font(.system(size: 300))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
                .drawingGroup()
                .accessibilityElement()
                .accessibilityLabel(emoji.annotation ?? SPPageType.emoji.localizedDescription)
                .accessibilityAddTraits(.isSelected)
        } else {
            Text(Image(systemName: "questionmark"))
                .font(.system(size: 300))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
                .drawingGroup()
                .accessibilityLabel(emoji.annotation ?? SPPageType.emoji.localizedDescription)
                .accessibilityAddTraits(.isSelected)
        }
    }
    
    public init(emoji: SPEmoji) {
        self.emoji = emoji
    }
}

struct SPEmojiSkinView: View {
    private let skin: SPEmoji.Skin
    
    public var body: some View {
        if skin.isAvailable() {
            Text(skin.emojiString())
                .font(.system(size: 300))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
                .drawingGroup()
        } else {
            Text(Image(systemName: "questionmark"))
                .font(.system(size: 300))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
                .drawingGroup()
        }
    }

    public init(skin: SPEmoji.Skin) {
        self.skin = skin
    }
}
