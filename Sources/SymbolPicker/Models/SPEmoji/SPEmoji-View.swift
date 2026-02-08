//
//  SPEmoji-View.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

extension SPEmoji: View{
    @_documentation(visibility: internal)
    @ViewBuilder
    public var body: some View{
        Text(self.emojiString())
    }
}
