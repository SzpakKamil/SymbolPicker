//
//  SPColor-ShapeStyle.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

extension SPColor: ShapeStyle {
    public func resolve(in proxy: EnvironmentValues) -> Color {
        return color
    }
}
