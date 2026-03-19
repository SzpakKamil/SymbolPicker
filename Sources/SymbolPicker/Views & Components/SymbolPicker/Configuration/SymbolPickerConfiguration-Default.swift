//
//  SymbolPickerConfiguration-Default.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

@MainActor
public extension SymbolPickerConfiguration {
    var symbolVariant: SPSymbol.Variant { .filled }
    
    var supportedTypes: [SPPageType] { SPPageType.allCases }
    
    public var defaultType: SPPageType { .symbol }
    
    var allowSearching: Bool { true }
    
    var displayStyle: SPDisplayStyle {
        if #available(iOS 26.0, visionOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            return .compact
        } else {
            return .detail
        }
    }
}
