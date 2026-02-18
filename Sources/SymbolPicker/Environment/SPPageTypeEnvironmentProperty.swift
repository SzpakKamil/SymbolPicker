//
//  SPPageTypeEnvironmentProperty.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

private struct SPPageTypeEnvironmentKey: EnvironmentKey {
    static let defaultValue: Binding<SPPageType> = .constant(.image)
}

public extension EnvironmentValues {
  var spPageType: Binding<SPPageType> {
    get { self[SPPageTypeEnvironmentKey.self] }
    set { self[SPPageTypeEnvironmentKey.self] = newValue }
  }
}
