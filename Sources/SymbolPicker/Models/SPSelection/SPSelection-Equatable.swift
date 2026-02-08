//
//  SPSelection-Equatable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 06/02/2026.
//

import SwiftUI

extension SPSelection: Equatable{
    public static func == (lhs: SPSelection, rhs: SPSelection) -> Bool {
        lhs.id == rhs.id
    }
}
