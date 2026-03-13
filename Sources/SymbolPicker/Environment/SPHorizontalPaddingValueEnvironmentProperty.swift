//
//  SPHorizontalPaddingValueEnvironmentProperty.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

private struct SPHorizontalPaddingValueEnvironmentProperty: EnvironmentKey {
    static let defaultValue: CGFloat = 0
}

extension EnvironmentValues {
    var spHorizontalPadding: CGFloat {
        get { self[SPHorizontalPaddingValueEnvironmentProperty.self] }
        set { self[SPHorizontalPaddingValueEnvironmentProperty.self] = newValue }
    }
}
