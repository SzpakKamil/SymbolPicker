//
//  SPAllowedPageTypesEnviromentKey.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 16/03/2026.
//

import SwiftUI

private struct SPAllowedPageTypesEnviromentKey: EnvironmentKey {
    static let defaultValue: [SPPageType] = SPPageType.allCases
}

public extension EnvironmentValues {
    var spAllowedPageTypes: [SPPageType] {
        get { self[SPAllowedPageTypesEnviromentKey.self] }
        set { self[SPAllowedPageTypesEnviromentKey.self] = newValue }
    }
}
