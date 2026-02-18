//
//  IfExtension.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 15/02/2026.
//


import SwiftUI

public extension View {
    @ViewBuilder func `if`<Transform: View>(@ViewBuilder transform: (Self) -> Transform) -> some View {
        transform(self)
    }
}
