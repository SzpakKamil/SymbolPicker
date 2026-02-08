//
//  SPColor-Codable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import Foundation


extension SPColor: Codable {
    // MARK: - Codable
    @_documentation(visibility: internal)
    public enum CodingKeys: String, CodingKey {
        case id, darkId, highContrastId, colorSpace
        case components, darkComponents, highContrastComponents
    }
    @_documentation(visibility: internal)
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let darkId = try container.decodeIfPresent(String.self, forKey: .darkId)
        let highContrastId = try container.decodeIfPresent(String.self, forKey: .highContrastId)
        let colorSpace = try container.decode(SPColorSpace.self, forKey: .colorSpace)
        
        // Helper to reconstruct definition from ID or Components
        let resolveDef = { (id: String, key: CodingKeys) -> ColorDefinition? in
            if let def = Self.makeDefinition(from: id) {
                return def
            }
            // Fallback: Try decoding components
            if let comps = try? container.decodeIfPresent(RGBA.self, forKey: key) {
                // Generate hex from components to satisfy Custom requirement
                let f = { (v: Double) in Int((min(max(v, 0), 1) * 255)) }
                let hex = String(format: "#%02x%02x%02x%02x", f(comps.r), f(comps.g), f(comps.b), f(comps.a))
                return .custom(hex: hex, rgba: comps)
            }
            return nil
        }
        
        guard let primary = resolveDef(id, .components) else {
            throw DecodingError.dataCorruptedError(forKey: .id, in: container, debugDescription: "Invalid color ID: \(id) and no fallback components found.")
        }
        
        let dark = darkId.flatMap { resolveDef($0, .darkComponents) }
        let highContrast = highContrastId.flatMap { resolveDef($0, .highContrastComponents) }
        
        self.init(primary: primary, dark: dark, highContrast: highContrast, colorSpace: colorSpace)
    }
    @_documentation(visibility: internal)
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(darkId, forKey: .darkId)
        try container.encodeIfPresent(highContrastId, forKey: .highContrastId)
        try container.encode(colorSpace, forKey: .colorSpace)
        
        // Always encode components as fallback
        if let c = resolvedComponents(for: primary) {
            try container.encode(c, forKey: .components)
        }
        if let d = dark, let c = resolvedComponents(for: d) {
            try container.encode(c, forKey: .darkComponents)
        }
        if let h = highContrast, let c = resolvedComponents(for: h) {
            try container.encode(c, forKey: .highContrastComponents)
        }
    }
    
    private func resolvedComponents(for layer: ColorDefinition) -> RGBA? {
        switch layer {
        case .standard(let name):
            return SPColor.registry[name]?.components
        case .custom(_, let c):
            return c
        }
    }
}


