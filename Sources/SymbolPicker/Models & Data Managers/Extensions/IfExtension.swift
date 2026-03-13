//
//  IfExtension.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Transform: View>(@ViewBuilder transform: (Self) -> Transform) -> some View {
        transform(self)
    }
}
