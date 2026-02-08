//
//  SPSelection-Hashable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 06/02/2026.
//

import SwiftUI

extension SPSelection: Hashable{
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
