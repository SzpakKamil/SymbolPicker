//
//  SymbolPickerDismissType.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 06/06/2025.
//

import Foundation

public enum SymbolPickerDismissType: Identifiable, Equatable, Codable, Hashable {
    case onSymbolSelect
    case manual
    
    public var id: Int {
        switch self {
        case .onSymbolSelect:
            return 0
        case .manual:
            return 1
        }
    }
    
    // Custom CodingKeys to define the key names for encoding/decoding
    @_documentation(visibility: internal)
    private enum CodingKeys: String, CodingKey {
        case dismissType
    }
    
    // Custom initializer for decoding
    @_documentation(visibility: internal)
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dismissTypeString = try container.decode(String.self, forKey: .dismissType)
        
        switch dismissTypeString {
        case "onSymbolSelect":
            self = .onSymbolSelect
        case "manual":
            self = .manual
        default:
            throw DecodingError.dataCorruptedError(
                forKey: .dismissType,
                in: container,
                debugDescription: "Invalid dismiss type value: \(dismissTypeString)"
            )
        }
    }
    
    // Custom method for encoding
    @_documentation(visibility: internal)
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let dismissTypeString: String
        switch self {
        case .onSymbolSelect:
            dismissTypeString = "onSymbolSelect"
        case .manual:
            dismissTypeString = "manual"
        }
        try container.encode(dismissTypeString, forKey: .dismissType)
    }
    
    @_documentation(visibility: internal)
    public static func == (lhs: SymbolPickerDismissType, rhs: SymbolPickerDismissType) -> Bool {
        lhs.id == rhs.id
    }
}
