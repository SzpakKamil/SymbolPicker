//
//  SPPresentation-BackgroundInteraction.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

extension SPPresentationConfiguration{
    public enum BackgroundInteraction: Sendable{
        case automatic
        case available(upThrough: SPPresentationConfiguration.PresentationDents)
        case enabled
        case disabled
        
        #if os(iOS) || os(visionOS)
        @available(iOS 16.4, *)
        func asPresentationBackgroundInteraction() -> PresentationBackgroundInteraction{
            switch self {
            case .automatic:
                return .automatic
            case .enabled:
                return .enabled
            case .disabled:
                return .disabled
            case .available(let upThrough):
                return .enabled(upThrough: upThrough.asPresentationSize())
            }
        }
        #endif
    }
}
