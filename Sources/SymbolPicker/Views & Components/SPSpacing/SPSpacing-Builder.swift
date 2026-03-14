//
//  SPSpacingBuilder.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 14/03/2026.
//

import SwiftUI

@resultBuilder
public struct SPSpacingBuilder {
    public static func buildBlock() -> [SPSpacing] {
        []
    }
    
    public static func buildPartialBlock(accumulated: [SPSpacing], next: [SPSpacing]) -> [SPSpacing] {
        return accumulated + next
    }
    
    public static func buildArray(_ components: [[SPSpacing]]) -> [SPSpacing] {
        return components.flatMap{ $0 }
    }
    public static func buildFinalResult(_ component: [SPSpacing]) -> [SPSpacing] {
        return component
    }
    public static func buildBlock(_ components: SPSpacing...) -> [SPSpacing] {
        return components
    }
    
    public static func buildBlock(_ components: [SPSpacing]) -> [SPSpacing]{
        components
    }
    public static func buildBlock(_ components: [SPSpacing]...) -> [SPSpacing] {
        components.flatMap{ $0 }
    }
    public static func buildBlock(_ components: [[SPSpacing]]) -> [SPSpacing] {
        components.flatMap{ $0 }
    }
    public static func buildOptional(_ component: [SPSpacing]?) -> [SPSpacing] {
        component ?? []
    }
    public static func buildEither(first component: [SPSpacing]) -> [SPSpacing] {
        component
    }
    public static func buildEither(second component: [SPSpacing]) -> [SPSpacing] {
        component
    }
    public static func buildLimitedAvailability(_ component: [SPSpacing]) -> [SPSpacing] {
        component
    }
    public static func buildExpression(_ components: SPSpacing...) -> [SPSpacing] {
        return components
    }
    public static func buildExpression(_ components: [SPSpacing]) -> [SPSpacing] {
        return components
    }
}
