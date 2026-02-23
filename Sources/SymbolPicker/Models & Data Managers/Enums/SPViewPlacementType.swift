//
//  SPViewPlacementType.swift
//  SymbolPicker
//
//  Refactored for Performance & Network Safety
//

import SwiftUI

public enum SPViewPlacementType:  Sendable, Equatable, Hashable {
    #if os(watchOS)
    case topTrailing
    case bottomLeading
    case bottom
    case bottomTrailing
    #endif
    case scrollContent
    case safeArea

}
