//
//  SymbolSection.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 11/06/2025.
//

import Foundation

public struct SymbolSection: Identifiable, Equatable, Sendable, Comparable, Hashable {
    public var id: String { title }
    let title: String
    let symbols: [SymbolModel]
    
    public static func <(lhs: SymbolSection, rhs: SymbolSection) -> Bool {
        return lhs.title < rhs.title
    }
    public static func ==(lhs: SymbolSection, rhs: SymbolSection) -> Bool {
        return lhs.id == rhs.id && lhs.symbols == rhs.symbols
    }
}
