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
    
}
