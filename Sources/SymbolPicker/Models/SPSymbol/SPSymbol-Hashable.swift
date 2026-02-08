//
//  SPSymbol-Hashable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

extension SPSymbol: Hashable{
    @_documentation(visibility: internal)
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
