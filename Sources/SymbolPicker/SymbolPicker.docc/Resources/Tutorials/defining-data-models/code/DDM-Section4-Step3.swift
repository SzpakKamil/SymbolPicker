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
    var symbolName: String
    var symbolColor: SymbolColor
    
}
