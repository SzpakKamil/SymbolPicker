//
//  SPCalculateScaleEnvironmentProperty.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

private struct SPCalculateScaleEnvironmentProperty: EnvironmentKey {
    static let defaultValue: CGFloat = 1.0
}

extension EnvironmentValues {
  public var spCalculateScale: CGFloat {
    get { self[SPCalculateScaleEnvironmentProperty.self] }
    set { self[SPCalculateScaleEnvironmentProperty.self] = newValue }
  }
}
