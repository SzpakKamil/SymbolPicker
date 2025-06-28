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
class Type: Identifiable, Equatable, Hashable, Comparable, Hashable{
    var id = UUID()
    var title: String
    var symbolName: String
    var color: SymbolColor
    
    init(title: String = "", details: String = "", symbolName: String = "archivebox", symbolColor: SymbolColor = .purple) {
        self.title = title
        self.symbolName = symbolName
        self.symbolColor = symbolColor
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Event, rhs: Event) -> Bool{
        lhs.id == rhs.id
    }
    static func <(lhs: Event, rhs: Event) -> Bool{
        lhs.title < rhs.title
    }
}
