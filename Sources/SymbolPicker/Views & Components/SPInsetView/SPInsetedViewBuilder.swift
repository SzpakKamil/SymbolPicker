//
//  SPInsetedView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

@resultBuilder
public struct SPInsetedViewBuilder {
    public static func buildBlock() -> [SPInsetedView] {
        []
    }
    public static func buildBlock(_ components: SPInsetedView...) -> [SPInsetedView] {
        components
    }
    
    public static func buildBlock(_ components: [SPInsetedView]) -> [SPInsetedView]{
        components
    }
    public static func buildBlock(_ components: [SPInsetedView]...) -> [SPInsetedView] {
        components.flatMap{ $0 }
    }
    public static func buildOptional(_ component: [SPInsetedView]?) -> [SPInsetedView] {
        component ?? []
    }
    public static func buildEither(first component: [SPInsetedView]) -> [SPInsetedView] {
        component
    }
    public static func buildEither(second component: [SPInsetedView]) -> [SPInsetedView] {
        component
    }
    public static func buildLimitedAvailability(_ component: [SPInsetedView]) -> [SPInsetedView] {
        component
    }
    public static func buildExpression(_ components: SPInsetedView...) -> [SPInsetedView] {
        return components
    }
}
