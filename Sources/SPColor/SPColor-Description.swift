//
//  SPColor-Description.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import Foundation

extension SPColor: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        if let metadata = Self.registry[id] {
            return metadata.localizedKey
        }
        return "SymbolPickerColors.CustomColor"
    }
    
    public var debugDescription: String {
        return "SPColor(id: \(id) dark: \(darkId, default: "nil") hc: \(highContrastId, default: "nil") space: \(colorSpace.rawValue)"
    }
}
