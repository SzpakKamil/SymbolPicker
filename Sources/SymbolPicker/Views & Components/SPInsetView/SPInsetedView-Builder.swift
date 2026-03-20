//
//  SPInsetedViewBuilder.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

@resultBuilder
public struct SPInsetedViewBuilder {
    @_documentation(visibility: internal)
    public static func buildBlock() -> [SPInsetedView] {
        []
    }
    
    @_documentation(visibility: internal)
    public static func buildPartialBlock(accumulated: [SPInsetedView], next: [SPInsetedView]) -> [SPInsetedView] {
        return accumulated + next
    }
    
    @_documentation(visibility: internal)
    public static func buildArray(_ components: [[SPInsetedView]]) -> [SPInsetedView] {
        return components.flatMap{ $0 }
    }
    @_documentation(visibility: internal)
    public static func buildFinalResult(_ component: [SPInsetedView]) -> [SPInsetedView] {
        return component
    }
    @_documentation(visibility: internal)
    public static func buildBlock(_ components: SPInsetedView...) -> [SPInsetedView] {
        return components
    }
    
    @_documentation(visibility: internal)
    public static func buildBlock(_ components: [SPInsetedView]) -> [SPInsetedView]{
        components
    }
    @_documentation(visibility: internal)
    public static func buildBlock(_ components: [SPInsetedView]...) -> [SPInsetedView] {
        components.flatMap{ $0 }
    }
    @_documentation(visibility: internal)
    public static func buildBlock(_ components: [[SPInsetedView]]) -> [SPInsetedView] {
        components.flatMap{ $0 }
    }
    @_documentation(visibility: internal)
    public static func buildOptional(_ component: [SPInsetedView]?) -> [SPInsetedView] {
        component ?? []
    }
    @_documentation(visibility: internal)
    public static func buildEither(first component: [SPInsetedView]) -> [SPInsetedView] {
        component
    }
    @_documentation(visibility: internal)
    public static func buildEither(second component: [SPInsetedView]) -> [SPInsetedView] {
        component
    }
    @_documentation(visibility: internal)
    public static func buildLimitedAvailability(_ component: [SPInsetedView]) -> [SPInsetedView] {
        component
    }
    @_documentation(visibility: internal)
    public static func buildExpression(_ components: SPInsetedView...) -> [SPInsetedView] {
        return components
    }
    @_documentation(visibility: internal)
    public static func buildExpression(_ components: [SPInsetedView]) -> [SPInsetedView] {
        return components
    }
}
