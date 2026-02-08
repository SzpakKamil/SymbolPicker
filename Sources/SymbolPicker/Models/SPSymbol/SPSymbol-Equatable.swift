//
//  SPSymbol-Equatable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

extension SPSymbol: Equatable{
    @_documentation(visibility: internal)
    public static func == (lhs: SPSymbol, rhs: SPSymbol) -> Bool {
        lhs.id == rhs.id
    }
}
