//
//  Event.swift
//  Checker
//
//  Created by Kamil Szpak on 21/06/2025.
//

import Foundation
import SwiftData
import SymbolPicker

@Model
class Event: Identifiable, Equatable, Hashable, Comparable{
    var id = UUID()
    var title: String
    var details: String
    var type: Type?
    var symbolName: String
    var symbolColor: SymbolColor
    
    init(title: String = "", details: String = "", symbolName: String = "calendar", symbolColor: SymbolColor = .purple) {
        self.title = title
        self.details = details
        self.symbolName = symbolName
        self.symbolColor = symbolColor
    }
    
    static func ==(lhs: Event, rhs: Event) -> Bool{
        lhs.id == rhs.id
    }
    static func <(lhs: Event, rhs: Event) -> Bool{
        lhs.title < rhs.title
    }
}
