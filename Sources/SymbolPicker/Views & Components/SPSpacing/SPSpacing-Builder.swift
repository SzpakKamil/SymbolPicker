//
//  SPSpacingBuilder.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 14/03/2026.
//

import SwiftUI

@resultBuilder
public struct SPSpacingBuilder {
    @_documentation(visibility: internal)
    public static func buildBlock() -> [SPSpacing] {
        []
    }
    
    @_documentation(visibility: internal)
    public static func buildPartialBlock(accumulated: [SPSpacing], next: [SPSpacing]) -> [SPSpacing] {
        return accumulated + next
    }
    
    @_documentation(visibility: internal)
    public static func buildArray(_ components: [[SPSpacing]]) -> [SPSpacing] {
        return components.flatMap{ $0 }
    }
    @_documentation(visibility: internal)
    public static func buildFinalResult(_ component: [SPSpacing]) -> [SPSpacing] {
        return component
    }
    @_documentation(visibility: internal)
    public static func buildBlock(_ components: SPSpacing...) -> [SPSpacing] {
        return components
    }
    
    @_documentation(visibility: internal)
    public static func buildBlock(_ components: [SPSpacing]) -> [SPSpacing]{
        components
    }
    @_documentation(visibility: internal)
    public static func buildBlock(_ components: [SPSpacing]...) -> [SPSpacing] {
        components.flatMap{ $0 }
    }
    @_documentation(visibility: internal)
    public static func buildBlock(_ components: [[SPSpacing]]) -> [SPSpacing] {
        components.flatMap{ $0 }
    }
    @_documentation(visibility: internal)
    public static func buildOptional(_ component: [SPSpacing]?) -> [SPSpacing] {
        component ?? []
    }
    @_documentation(visibility: internal)
    public static func buildEither(first component: [SPSpacing]) -> [SPSpacing] {
        component
    }
    @_documentation(visibility: internal)
    public static func buildEither(second component: [SPSpacing]) -> [SPSpacing] {
        component
    }
    @_documentation(visibility: internal)
    public static func buildLimitedAvailability(_ component: [SPSpacing]) -> [SPSpacing] {
        component
    }
    @_documentation(visibility: internal)
    public static func buildExpression(_ components: SPSpacing...) -> [SPSpacing] {
        return components
    }
    @_documentation(visibility: internal)
    public static func buildExpression(_ components: [SPSpacing]) -> [SPSpacing] {
        return components
    }
}
