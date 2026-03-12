//
//  SPCalculateOffsetEnvironmentProperty.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

private struct SPCalculateOffsetEnvironmentProperty: EnvironmentKey {
    static let defaultValue: CGFloat = 0
}

extension EnvironmentValues {
    var spCalculateOffset: CGFloat {
    get { self[SPCalculateOffsetEnvironmentProperty.self] }
    set { self[SPCalculateOffsetEnvironmentProperty.self] = newValue }
  }
}
