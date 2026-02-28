//
//  SPInsetedView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public struct SPInsetedView: @unchecked Sendable{
    var view: AnyView
    var background: AnyView?
    var paddings: [Edge.Set: CGFloat?]
    let placement: SPViewPlacementType
    
    public init(placement: SPViewPlacementType, spacing: CGFloat? = nil, @ViewBuilder view: () -> some View) {
        #if os(watchOS)
        self.view = AnyView(view())
        #else
        self.view = AnyView(VStack(spacing: spacing){view()})
        #endif
        self.paddings = [:]
        self.placement = placement
        self.background = nil
    }
    
    public func spPadding(_ edges: Edge.Set, value: CGFloat?) -> Self{
        var copy = self
        copy.paddings[edges] = value
        return copy
    }

    public func spBackground<V: View>(@ViewBuilder _ background: () -> V) -> Self {
        var copy = self
        copy.background = AnyView(background())
        return copy
    }
}

