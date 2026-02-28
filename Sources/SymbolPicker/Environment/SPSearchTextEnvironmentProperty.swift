//
//  SPSearchTextEnviromentProperty.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

private struct SPSearchTextEnviromentKey: EnvironmentKey {
    static let defaultValue: Binding<String> = .constant("")
}

public extension EnvironmentValues {
    var spSearchText: Binding<String> {
        get { self[SPSearchTextEnviromentKey.self] }
        set { self[SPSearchTextEnviromentKey.self] = newValue }
    }
}
