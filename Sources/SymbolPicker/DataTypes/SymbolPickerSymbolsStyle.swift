//
//  SymbolPickerSymbolsStyle.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 06/06/2025.
//

import Foundation

public enum SymbolPickerSymbolsStyle: Identifiable, Equatable, Codable, Hashable {
    case filled
    case outlined
    
    public var id: Int {
        switch self {
        case .filled:
            return 0
        case .outlined:
            return 1
        }
    }
    
    // Custom CodingKeys to define the key names for encoding/decoding
    @_documentation(visibility: internal)
    private enum CodingKeys: String, CodingKey {
        case style
    }
    
    // Custom initializer for decoding
    @_documentation(visibility: internal)
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let styleString = try container.decode(String.self, forKey: .style)
        
        switch styleString {
        case "filled":
            self = .filled
        case "outlined":
            self = .outlined
        default:
            throw DecodingError.dataCorruptedError(
                forKey: .style,
                in: container,
                debugDescription: "Invalid style value: \(styleString)"
            )
        }
    }
    
    // Custom method for encoding
    @_documentation(visibility: internal)
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let styleString: String
        switch self {
        case .filled:
            styleString = "filled"
        case .outlined:
            styleString = "outlined"
        }
        try container.encode(styleString, forKey: .style)
    }
    
    @_documentation(visibility: internal)
    public static func == (lhs: SymbolPickerSymbolsStyle, rhs: SymbolPickerSymbolsStyle) -> Bool {
        lhs.id == rhs.id
    }
}
