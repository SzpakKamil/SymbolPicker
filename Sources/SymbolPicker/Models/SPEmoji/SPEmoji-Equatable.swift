//
//  SPEmoji-Equatable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

extension SPEmoji: Equatable{
    @_documentation(visibility: internal)
    public static func ==(lhs: SPEmoji, rhs: SPEmoji) -> Bool {
        lhs.id == rhs.id
    }
}
