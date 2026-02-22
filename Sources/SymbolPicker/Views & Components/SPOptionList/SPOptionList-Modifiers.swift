//
//  SwiftUIView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

public extension SPOptionList{
    func spSetView(edge: VerticalEdge, type: SPViewPlacementType, spacing: CGFloat = 10, @ViewBuilder view: () -> some View) -> SPOptionList{
        var copy = self
        switch edge {
        case .top:
            copy.style.topView = InsetedView(view: AnyView(VStack(spacing: spacing){view()}), inset: type)
        case .bottom:
            copy.style.bottomView = InsetedView(view: AnyView(VStack(spacing: spacing){view()}), inset: type)
        }
        return copy
    }
}
