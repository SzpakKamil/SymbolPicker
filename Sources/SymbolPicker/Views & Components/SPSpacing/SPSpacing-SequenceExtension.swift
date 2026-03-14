//
//  SPSpacing-SequenceExtension.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 14/03/2026.
//

import SwiftUI

extension Sequence where Element == SPSpacing {
    public func getValue(_ attribute: SPSpacing.Attribute, for component: SPSpacing.Component, at typeSize: DynamicTypeSize) -> CGFloat {
        guard let spacing = self.first(where: { $0.component == component }) else {
            return 0
        }
        
        return spacing.getValue(for: attribute, at: typeSize)
    }
}
