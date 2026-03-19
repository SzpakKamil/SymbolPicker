//
//  SPViewPlacement.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public enum SPViewPlacementType: Int, Identifiable, Sendable, Hashable{
    case safeAreaTop
    case safeAreaBottom
    case scrollContentTop
    case scrollSectionTop
    case scrollSectionBottom
    case scrollContentBottom
    #if os(iOS) || os(watchOS)
    #if os(iOS)
    case toolbarTopLeading
    #endif
    case toolbarTopTralling
    case toolbarBottomLeading
    case toolbarBottom
    case toolbarBottomTralling
    #endif
    
    public var id: Int{
        rawValue
    }
}
