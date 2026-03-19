//
//  SPCategory.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public struct SPCategory<DataAsset: SPDataAsset>: Identifiable, Equatable, Comparable, Sendable {
    public var id: String { category }
    public let category: String
    public let elements: [DataAsset]
    
    @_documentation(visibility: internal)
    public static func == (lhs: SPCategory<DataAsset>, rhs: SPCategory<DataAsset>) -> Bool {
        lhs.category == rhs.category && lhs.elements == rhs.elements
    }
    
    @_documentation(visibility: internal)
    public static func < (lhs: SPCategory<DataAsset>, rhs: SPCategory<DataAsset>) -> Bool {
        lhs.category < rhs.category
    }
}
