//
//  SwiftUIView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

public extension SymbolPicker.Configuration{
    func spSetView(edge: VerticalEdge, type: SPViewPlacementType, spacing: CGFloat = 10, @ViewBuilder view: () -> some View) -> SymbolPicker.Configuration{
        var copy = self
        switch edge {
        case .top:
            copy.topView = SPInsetedView(inset: type, spacing: spacing){view()}
        case .bottom:
            copy.bottomView = SPInsetedView(inset: type, spacing: spacing){view()}
        }
        return copy
    }
}
