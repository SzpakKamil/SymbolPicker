//
//  SPCategory.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

struct SPCategory<T: SPDataAsset>: Identifiable, Equatable, Comparable {
    var id: String { category }
    let category: String
    let elements: [T]
    
    static func == (lhs: SPCategory<T>, rhs: SPCategory<T>) -> Bool {
        lhs.category == rhs.category && lhs.elements == rhs.elements
    }
    
    static func < (lhs: SPCategory<T>, rhs: SPCategory<T>) -> Bool {
        lhs.category < rhs.category
    }
}
