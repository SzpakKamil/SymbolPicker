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
    
    init(title: String = "", details: String = "", symbolName: String = "archivebox", symbolColor: SymbolColor = .purple) {
        self.title = title
        self.symbolName = symbolName
        self.symbolColor = symbolColor
    }
    
}
