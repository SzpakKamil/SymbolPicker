//
//  SPPreviewCalculateOffsetEnvironmentProperty.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

private struct SPPreviewCalculateOffsetEnvironmentProperty: EnvironmentKey {
    static let defaultValue: CGFloat = 0
}

extension EnvironmentValues {
    var spPreviewCalculateOffset: CGFloat {
    get { self[SPPreviewCalculateOffsetEnvironmentProperty.self] }
    set { self[SPPreviewCalculateOffsetEnvironmentProperty.self] = newValue }
  }
}

