//
//  SPSpacing.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 14/03/2026.
//

import SwiftUI


public struct SPSpacing: Sendable {
    public let component: Component
    private let valueProvider: @Sendable (Attribute, DynamicTypeSize) -> CGFloat

    public init(
        component: Component,
        configuration: @escaping @Sendable (DynamicTypeSize) -> Sizing
    ) {
        self.component = component
        valueProvider = { attribute, typeSize in
            let provided = configuration(typeSize)
            let defaults = SPSymbolPickerDefaultConfiguration.defaultSpacingConfiguration()

            switch attribute {
            case .width:
                return provided.width ?? defaults.getValue(.width, for: component, at: typeSize)
            case .height:
                return provided.height ?? defaults.getValue(.height, for: component, at: typeSize)
            case .horizontalPadding:
                return provided.horizontalPadding ?? defaults.getValue(.horizontalPadding, for: component, at: typeSize)
            case .verticalPadding:
                return provided.verticalPadding ?? defaults.getValue(.verticalPadding, for: component, at: typeSize)
            }
        }
    }

    public init(component: Component, width: CGFloat? = nil, height: CGFloat? = nil, horizontalPadding: CGFloat? = nil, verticalPadding: CGFloat? = nil) {
        self.init(component: component) { _ in
            Sizing(width: width, height: height, horizontalPadding: horizontalPadding, verticalPadding: verticalPadding)
        }
    }

    func getValue(for attribute: Attribute, at typeSize: DynamicTypeSize) -> CGFloat {
        valueProvider(attribute, typeSize)
    }
}



