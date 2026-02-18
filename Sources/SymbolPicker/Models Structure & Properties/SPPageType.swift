//
//  SPPageType.swift
//  SymbolPicker
//
//  Refactored for Performance & Network Safety
//

import SwiftUI

public enum SPPageType: String, Codable, Sendable, Equatable, CaseIterable, Identifiable, Hashable {
    case image = "Image"
    case emoji = "Emoji"
    case symbol = "Symbol"
    
    public var id: String{
        rawValue
    }

    var localizedDescription: String {
        if #available (iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *){
            return String(localized: .init("SPPageType.\(rawValue)"), bundle: .module)
        } else {
            return NSLocalizedString(.init("SPPageType.\(rawValue)"), bundle: .module, comment: "")
        }
    }
}
