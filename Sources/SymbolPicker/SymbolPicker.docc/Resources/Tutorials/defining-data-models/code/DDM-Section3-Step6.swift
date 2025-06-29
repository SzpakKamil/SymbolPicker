//
//  Type.swift
//  Checker
//
//  Created by Kamil Szpak on 27/06/2025.
//

import Foundation
import SymbolPicker
import SwiftData

@Model
class Type: Identifiable, Equatable, Hashable, Comparable{
    var id = UUID()
    var title: String
    var symbolName: String
    var symbolColor: SymbolColor
    
    var isInvalid: Bool{
        title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    init(title: String = "", details: String = "", symbolName: String = "archivebox", symbolColor: SymbolColor = .purple) {
        self.title = title
        self.symbolName = symbolName
        self.symbolColor = symbolColor
    }
    
    static func ==(lhs: Type, rhs: Type) -> Bool{
        lhs.id == rhs.id
    }
    static func <(lhs: Type, rhs: Type) -> Bool{
        lhs.title < rhs.title
    }
}
