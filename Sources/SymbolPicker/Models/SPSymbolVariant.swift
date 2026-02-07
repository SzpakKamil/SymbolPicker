//
//  SPSelectionType.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

public enum SPSymbolVariant: Identifiable, Equatable, Hashable, Codable, Sendable {
    case filled
    case outlined
    
    public var id: String{
        switch self {
        case .filled:
            "Filled"
        case .outlined:
            "Outlined"
        }
    }
}

