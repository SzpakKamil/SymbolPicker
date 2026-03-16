//
//  SPAllowedPageTypesEnviromentKey.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 16/03/2026.
//

import SwiftUI

private struct SPAllowsColorSelectionEnviromentKey: EnvironmentKey {
    static let defaultValue: Bool = true
}

public extension EnvironmentValues {
    var spAllowsColorSelection: Bool {
        get { self[SPAllowsColorSelectionEnviromentKey.self] }
        set { self[SPAllowsColorSelectionEnviromentKey.self] = newValue }
    }
}
