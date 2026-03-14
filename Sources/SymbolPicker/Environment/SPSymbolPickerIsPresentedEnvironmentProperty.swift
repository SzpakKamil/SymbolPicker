//
//  SPSymbolPickerIsPresentedEnvironmentProperty.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 13/03/2026.
//

import SwiftUI

private struct SPSymbolPickerIsPresentedEnvironmentProperty: EnvironmentKey {
    static let defaultValue: Binding<Bool>? = nil
}

public extension EnvironmentValues {
    var spIsPresented: Binding<Bool>? {
        get { self[SPSymbolPickerIsPresentedEnvironmentProperty.self] }
        set { self[SPSymbolPickerIsPresentedEnvironmentProperty.self] = newValue }
    }
}
