//
//  EdgeSet-Hashable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

@_documentation(visibility: internal)
extension Edge.Set: @retroactive Hashable{
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}
