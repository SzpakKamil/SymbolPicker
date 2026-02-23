//
//  SPSelectionEnviromentProperty.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI
import ColorKit

private struct SPSelectionEnviromentKey: EnvironmentKey {
    static let defaultValue: Binding<SPSelection> = .constant(.color(value: CKColor.init(hexString: "#0000")))
}

public extension EnvironmentValues {
  public var spSelection: Binding<SPSelection> {
    get { self[SPSelectionEnviromentKey.self] }
    set { self[SPSelectionEnviromentKey.self] = newValue }
  }
}
