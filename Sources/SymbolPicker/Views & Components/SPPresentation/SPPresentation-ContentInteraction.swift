//
//  SPPresentation-ContentInteraction.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

extension SPPresentationConfiguration{
    public enum ContentInteraction: Sendable{
        case automatic
        case resizes
        case scrolls
        
        #if os(iOS) || os(visionOS)
        @available(iOS 16.4, *)
        func asPresentationContentInteraction() -> PresentationContentInteraction{
            switch self {
            case .automatic:
                return .automatic
            case .resizes:
                return .resizes
            case .scrolls:
                return .scrolls
            }
        }
        #endif
    }
}
