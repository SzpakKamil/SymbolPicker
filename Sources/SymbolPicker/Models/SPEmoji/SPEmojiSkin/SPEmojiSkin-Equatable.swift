//
//  SPEmojiSkin-Equatable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

extension SPEmoji.Skin: Equatable{
    @_documentation(visibility: internal)
    public static func ==(lhs: SPEmoji.Skin, rhs: SPEmoji.Skin) -> Bool {
        return lhs.id == rhs.id
    }
}
