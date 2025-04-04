//
//  SymbolColor.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI
import SwiftData

public enum SymbolColor: Int, Identifiable, Codable, CaseIterable, Hashable {
    
    case red = 0
    case orange = 1
    case yellow = 2
    case green = 3
    case mint = 4
    case teal = 5
    case cyan = 6
    case blue = 7
    case indigo = 8
    case purple = 9
    case magenta = 10
    case pink = 11
    case grey = 12
    case moro = 13
    case brown = 14
    
    public var id: Int { self.rawValue }
    
    public var name: String {
        switch self {
        case .red:
            return "Red"
        case .orange:
            return "Orange"
        case .yellow:
            return "Yellow"
        case .green:
            return "Green"
        case .mint:
            return "Mint"
        case .teal:
            return "Teal"
        case .cyan:
            return "Cyan"
        case .blue:
            return "Blue"
        case .indigo:
            return "Indigo"
        case .purple:
            return "Purple"
        case .magenta:
            return "Magenta"
        case .pink:
            return "Pink"
        case .grey:
            return "Grey"
        case .moro:
            return "Moro"
        case .brown:
            return "Brown"
        }
    }
    
    public var value: [Double] {
        switch self {
        case .red:
            return [0.906, 0.392, 0.416, 1]
        case .orange:
            return [0.945, 0.537, 0.427, 1]
        case .yellow:
            return [0.925, 0.671, 0.384, 1]
        case .green:
            return [0.945, 0.749, 0.298, 1]
        case .mint:
            return [0.451, 0.780, 0.435, 1]
        case .teal:
            return [0.216, 0.792, 0.678, 1]
        case .cyan:
            return [0.298, 0.698, 0.945, 1]
        case .blue:
            return [0.259, 0.514, 0.969, 1]
        case .indigo:
            return [0.302, 0.392, 0.737, 1]
        case .purple:
            return [0.490, 0.329, 0.729, 1]
        case .magenta:
            return [0.698, 0.490, 0.871, 1]
        case .pink:
            return [0.906, 0.557, 0.816, 1]
        case .grey:
            return [0.533, 0.565, 0.604, 1]
        case .moro:
            return [0.584, 0.663, 0.592, 1]
        case .brown:
            return [0.651, 0.565, 0.455, 1]
        }
    }
    
    public var color: Color {
        Color(red: self.value[0], green: self.value[1], blue: self.value[2])
    }
}
