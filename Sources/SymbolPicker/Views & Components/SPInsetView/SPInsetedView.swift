//
//  SPInsetedView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public struct SPInsetedView: @unchecked Sendable{
    var view: AnyView
    var paddings: [Edge.Set: CGFloat]
    let placement: SPViewPlacementType
    
    public init(placement: SPViewPlacementType, spacing: CGFloat? = nil, @ViewBuilder view: () -> some View) {
        #if os(watchOS)
        self.view = AnyView(view())
        #else
        self.view = AnyView(VStack(spacing: spacing){view()})
        #endif
        self.paddings = [:]
        self.placement = placement
    }
    
    public func spPadding(_ edges: Edge.Set, value: CGFloat) -> Self{
        var copy = self
        copy.paddings[edges] = value
        return copy
    }
}

extension Edge.Set: Hashable{
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}
