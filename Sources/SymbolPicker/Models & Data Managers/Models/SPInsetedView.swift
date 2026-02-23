//
//  SPInsetedView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public struct SPInsetedView: @unchecked Sendable{
    let view: AnyView
    let inset: SPViewPlacementType
    
    public init(inset: SPViewPlacementType, spacing: CGFloat, @ViewBuilder view: () -> some View) {
        self.view = AnyView(VStack(spacing: spacing){view()})
        self.inset = inset
    }
}
