//
//  SPPresentation-Default.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 15/03/2026.
//

import SwiftUI

@MainActor
public extension SymbolPickerConfiguration {
    func presentationConfiguration() -> SPPresentationConfiguration { return .init(style: displayStyle) }
    
    var presentation: SPPresentationConfiguration { presentationConfiguration() }
}
