//
//  SPSymbolVariantEnvironment.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

private struct SPSymbolVariantEnvironmentKey: EnvironmentKey {
    static let defaultValue = SPSymbol.Variant.filled
}

extension EnvironmentValues {
  var spSymbolVariant: SPSymbol.Variant {
    get { self[SPSymbolVariantEnvironmentKey.self] }
    set { self[SPSymbolVariantEnvironmentKey.self] = newValue }
  }
}
