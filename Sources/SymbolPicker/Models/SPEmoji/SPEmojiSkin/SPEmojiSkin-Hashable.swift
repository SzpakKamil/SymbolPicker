//
//  SPEmojiSkin-Hashable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

extension SPEmoji.Skin: Hashable{
    @_documentation(visibility: internal)
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
