//
//  SPCategory.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public struct SPCategory<T: SPDataAsset>: Identifiable, Equatable, Comparable, Sendable {
    public var id: String { category }
    let category: String
    let elements: [T]
    
    public static func == (lhs: SPCategory<T>, rhs: SPCategory<T>) -> Bool {
        lhs.category == rhs.category && lhs.elements == rhs.elements
    }
    
    public static func < (lhs: SPCategory<T>, rhs: SPCategory<T>) -> Bool {
        lhs.category < rhs.category
    }
}
