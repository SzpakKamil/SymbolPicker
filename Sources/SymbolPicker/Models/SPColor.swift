//
//  SPColor.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

public nonisolated enum SPColor: Identifiable, Equatable, Sendable, Codable, Hashable {
    public static var defaultCases: [SPColor] {
        [.red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .magenta, .pink, .grey, .moro, .brown]
    }
    
    case red
    case orange
    case yellow
    case green
    case mint
    case teal
    case cyan
    case blue
    case indigo
    case purple
    case magenta
    case pink
    case grey
    case moro
    case brown
    case customColor(red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat)
    
    public var id: String {
        return name
    }
    
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
        case .customColor(let r, let g, let b, let o):
            return "R:\(r)G:\(g)B:\(b)O:\(o)"
        }
    }
    
    public var value: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
        switch self {
        case .red:
            return (red: 0.906, green: 0.392, blue: 0.416, opacity: 1)
        case .orange:
            return (red: 0.945, green: 0.537, blue: 0.427, opacity: 1)
        case .yellow:
            return (red: 0.925, green: 0.671, blue: 0.384, opacity: 1)
        case .green:
            return (red: 0.945, green: 0.749, blue: 0.298, opacity: 1)
        case .mint:
            return (red: 0.451, green: 0.780, blue: 0.435, opacity: 1)
        case .teal:
            return (red: 0.216, green: 0.792, blue: 0.678, opacity: 1)
        case .cyan:
            return (red: 0.298, green: 0.698, blue: 0.945, opacity: 1)
        case .blue:
            return (red: 0.259, green: 0.514, blue: 0.969, opacity: 1)
        case .indigo:
            return (red: 0.302, green: 0.392, blue: 0.737, opacity: 1)
        case .purple:
            return (red: 0.490, green: 0.329, blue: 0.729, opacity: 1)
        case .magenta:
            return (red: 0.698, green: 0.490, blue: 0.871, opacity: 1)
        case .pink:
            return (red: 0.906, green: 0.557, blue: 0.816, opacity: 1)
        case .grey:
            return (red: 0.533, green: 0.565, blue: 0.604, opacity: 1)
        case .moro:
            return (red: 0.584, green: 0.663, blue: 0.592, opacity: 1)
        case .brown:
            return (red: 0.651, green: 0.565, 0.455, 1)
        case .customColor(let r, let g, let b, let o):
            return (red: r, green: g, blue: b, opacity: o)
        }
    }
    
    public var color: Color {
        switch self {
        case .customColor(let r, let g, let b, let o):
            return Color(red: r, green: g, blue: b, opacity: o)
        default:
            return Color(red: self.value.red, green: self.value.green, blue: self.value.blue)
        }
    }
    
    @_documentation(visibility: internal)
    public static func == (lhs: SPColor, rhs: SPColor) -> Bool {
        switch (lhs, rhs) {
        case (.customColor(let lr, let lg, let lb, let lo), .customColor(let rr, let rg, let rb, let ro)):
            return lr == rr && lg == rg && lb == rb && lo == ro
        default:
            return lhs.id == rhs.id
        }
    }
}
