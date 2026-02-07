//
//  SPSymbolVariantEnvironment.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

private struct SPSymbolVariantEnvironmentKey: EnvironmentKey {
    static let defaultValue = SPSymbolVariant.filled
}

extension EnvironmentValues {
  var symbolVariant: SPSymbolVariant {
    get { self[SPSymbolVariantEnvironmentKey.self] }
    set { self[SPSymbolVariantEnvironmentKey.self] = newValue }
  }
}
