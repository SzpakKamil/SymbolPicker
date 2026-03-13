//
//  SPSelectionEnviromentProperty.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

private struct SPSelectionEnviromentKey: EnvironmentKey {
    static let defaultValue: Binding<any SPSelectionProtocol> = Binding.constant(SPSelection<SPSymbol>(value: CKColor(hexString: "#0000"))).eraseToAnySPSelectionProtocol()
}

public extension EnvironmentValues {
    var spSelection: Binding<any SPSelectionProtocol> {
        get { self[SPSelectionEnviromentKey.self] }
        set { self[SPSelectionEnviromentKey.self] = newValue }
    }
}

extension Binding where Value: SPSelectionProtocol {
    func eraseToAnySPSelectionProtocol() -> Binding<any SPSelectionProtocol> {
        Binding<any SPSelectionProtocol>(
            get: { self.wrappedValue },
            set: {
                if let newValue = $0 as? Value {
                    self.wrappedValue = newValue
                }
            }
        )
    }
}
