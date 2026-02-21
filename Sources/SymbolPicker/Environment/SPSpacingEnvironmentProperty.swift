//
//  SPPageTypeEnvironmentProperty.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

private struct SPSpacingEnvironmentKey: EnvironmentKey {
    static let defaultValue: SPSpacing = .init()
}

extension EnvironmentValues {
  var spSpacing: SPSpacing {
    get { self[SPSpacingEnvironmentKey.self] }
    set { self[SPSpacingEnvironmentKey.self] = newValue }
  }
}
