//
//  SPColorPicker-Default.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 15/03/2026.
//

import SwiftUI

@MainActor
public extension SymbolPickerConfiguration {
    func colorPickerConfiguration() -> SPColorPickerConfiguration? { return .init(style: displayStyle) }
    
    var colorPicker: SPColorPickerConfiguration? { colorPickerConfiguration() }
}
