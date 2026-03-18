//
//  SPCategory.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public struct SPCategory<DataAsset: SPDataAsset>: Identifiable, Equatable, Comparable, Sendable {
    public var id: String { category }
    let category: String
    let elements: [DataAsset]
    
    public static func == (lhs: SPCategory<DataAsset>, rhs: SPCategory<DataAsset>) -> Bool {
        lhs.category == rhs.category && lhs.elements == rhs.elements
    }
    
    public static func < (lhs: SPCategory<DataAsset>, rhs: SPCategory<DataAsset>) -> Bool {
        lhs.category < rhs.category
    }
}
