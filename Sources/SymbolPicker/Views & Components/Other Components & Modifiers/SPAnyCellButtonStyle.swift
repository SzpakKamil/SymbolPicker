//
//  SPAnyCellButtonStyle.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 24/02/2026.
//

import SwiftUI

public struct SPAnyCellButtonStyle: ButtonStyle {
    private let _makeBody: (Configuration) -> AnyView

    public init<S: ButtonStyle>(_ style: S) {
        self._makeBody = { configuration in
            AnyView(style.makeBody(configuration: configuration))
        }
    }

    public func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}
