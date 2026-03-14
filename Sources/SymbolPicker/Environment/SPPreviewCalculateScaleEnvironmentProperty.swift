//
//  SPPreviewCalculateScaleEnvironmentProperty.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

private struct SPPreviewCalculateScaleEnvironmentProperty: EnvironmentKey {
    static let defaultValue: CGFloat = 1.0
}

extension EnvironmentValues {
    var spPreviewCalculateScale: CGFloat {
        get { self[SPPreviewCalculateScaleEnvironmentProperty.self] }
        set { self[SPPreviewCalculateScaleEnvironmentProperty.self] = newValue }
    }
}

