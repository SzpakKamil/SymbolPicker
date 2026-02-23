//
//  SPDisplaySize.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public enum SPDisplaySize: Sendable, Hashable{
    case large
    case medium
    case height(CGFloat)
    case fraction(CGFloat)
    
    #if os(iOS)
    @available(iOS 16.0, *)
    func asPresentationSize() -> PresentationDetent{
        switch self {
        case .large:
            return .large
        case .medium:
            return .medium
        case .height(let value):
            return .height(value)
        case .fraction(let value):
            return .fraction(value)
        }
    }
    #endif
}
