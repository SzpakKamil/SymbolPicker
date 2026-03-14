//
//  SPSpacing-Sizing.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 14/03/2026.
//

import SwiftUI

public extension SPSpacing{
    struct Sizing: Sendable {
        public var width: CGFloat?
        public var height: CGFloat?
        public var horizontalPadding: CGFloat?
        public var verticalPadding: CGFloat?
        
        public init(width: CGFloat? = nil, height: CGFloat? = nil, horizontalPadding: CGFloat? = nil, verticalPadding: CGFloat? = nil) {
            self.width = width
            self.height = height
            self.horizontalPadding = horizontalPadding
            self.verticalPadding = verticalPadding
        }
    }
}
