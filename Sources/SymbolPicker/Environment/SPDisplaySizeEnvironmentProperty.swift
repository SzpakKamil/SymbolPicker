//
//  SPDisplaySizeEnvironmentProperty.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

private struct SPDisplaySizeEnvironmentKey: EnvironmentKey {
    static let defaultValue: Binding<PresentationDetent> = .constant(.large)
}

public extension EnvironmentValues {
  var spDisplaySize: Binding<PresentationDetent> {
    get { self[SPDisplaySizeEnvironmentKey.self] }
    set { self[SPDisplaySizeEnvironmentKey.self] = newValue }
  }
}
