//
//  SPSymbolVariantEnvironment.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

private struct SymbolPickerStyleEnvironmentKey: EnvironmentKey {
    static let defaultValue: SPSymbolPickerConfiguration = SPSymbolPickerDefaultConfiguration()
}

public extension EnvironmentValues {
    var symbolPickerStyle: SPSymbolPickerConfiguration {
        get { self[SymbolPickerStyleEnvironmentKey.self] }
        set { self[SymbolPickerStyleEnvironmentKey.self] = newValue }
    }
}
