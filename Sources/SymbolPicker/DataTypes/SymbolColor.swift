//
//  SymbolColor.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

public enum SymbolColor: Identifiable, Equatable, Comparable, Codable, CaseIterable, Hashable {
    public static var allCases: [SymbolColor] {
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
    case customColor(red: Double, green: Double, blue: Double, alpha: Double)
    
    public var id: Double {
        switch self {
        case .red:
            0
        case .orange:
            1
        case .yellow:
            2
        case .green:
            3
        case .mint:
            4
        case .teal:
            5
        case .cyan:
            6
        case .blue:
            7
        case .indigo:
            8
        case .purple:
            9
        case .magenta:
            10
        case .pink:
            11
        case .grey:
            12
        case .moro:
            13
        case .brown:
            14
        case .customColor(let r, let g, let b, let a):
            (r + 0.1) * (g + 0.1) * (b + 0.1) * (a + 0.1)
        }
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
        case .customColor:
            return "Custom"
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
        case .customColor(let r, let g, let b, let a):
            return [r, g, b, a]
        }
    }
    
    public var color: Color {
        switch self {
        case .customColor(let r, let g, let b, _):
            return Color(red: r, green: g, blue: b)
        default:
            return Color(red: self.value[0], green: self.value[1], blue: self.value[2])
        }
    }
    
    @_documentation(visibility: internal)
    public static func == (lhs: SymbolColor, rhs: SymbolColor) -> Bool {
        switch (lhs, rhs) {
        case (.customColor(let lr, let lg, let lb, let la), .customColor(let rr, let rg, let rb, let ra)):
            return lr == rr && lg == rg && lb == rb && la == ra
        default:
            return lhs.id == rhs.id
        }
    }
    
    @_documentation(visibility: internal)
    public static func < (lhs: SymbolColor, rhs: SymbolColor) -> Bool {
        lhs.id < rhs.id
    }
    
    // MARK: - Codable Conformance
    @_documentation(visibility: internal)
    private enum CodingKeys: String, CodingKey {
        case type
        case customColorValues
    }

    @_documentation(visibility: internal)
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case "red":
            self = .red
        case "orange":
            self = .orange
        case "yellow":
            self = .yellow
        case "green":
            self = .green
        case "mint":
            self = .mint
        case "teal":
            self = .teal
        case "cyan":
            self = .cyan
        case "blue":
            self = .blue
        case "indigo":
            self = .indigo
        case "purple":
            self = .purple
        case "magenta":
            self = .magenta
        case "pink":
            self = .pink
        case "grey":
            self = .grey
        case "moro":
            self = .moro
        case "brown":
            self = .brown
        case "customColor":
            let values = try container.decode([Double].self, forKey: .customColorValues)
            guard values.count == 4 else {
                throw DecodingError.dataCorruptedError(
                    forKey: .customColorValues,
                    in: container,
                    debugDescription: "Custom color must have exactly 4 values (RGBA)"
                )
            }
            self = .customColor(red: values[0], green: values[1], blue: values[2], alpha: values[3])
        default:
            throw DecodingError.dataCorruptedError(
                forKey: .type,
                in: container,
                debugDescription: "Unknown color type: \(type)"
            )
        }
    }
    
    @_documentation(visibility: internal)
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .red:
            try container.encode("red", forKey: .type)
        case .orange:
            try container.encode("orange", forKey: .type)
        case .yellow:
            try container.encode("yellow", forKey: .type)
        case .green:
            try container.encode("green", forKey: .type)
        case .mint:
            try container.encode("mint", forKey: .type)
        case .teal:
            try container.encode("teal", forKey: .type)
        case .cyan:
            try container.encode("cyan", forKey: .type)
        case .blue:
            try container.encode("blue", forKey: .type)
        case .indigo:
            try container.encode("indigo", forKey: .type)
        case .purple:
            try container.encode("purple", forKey: .type)
        case .magenta:
            try container.encode("magenta", forKey: .type)
        case .pink:
            try container.encode("pink", forKey: .type)
        case .grey:
            try container.encode("grey", forKey: .type)
        case .moro:
            try container.encode("moro", forKey: .type)
        case .brown:
            try container.encode("brown", forKey: .type)
        case .customColor(let r, let g, let b, let a):
            try container.encode("customColor", forKey: .type)
            try container.encode([r, g, b, a], forKey: .customColorValues)
        }
    }
}
