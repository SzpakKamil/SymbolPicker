//
//  SPPresentation-Type.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

extension SPPresentationConfiguration{
    public enum DisplayType: Sendable{
        case `default`
        case popover
        case sheet
        case fullScreenCover
    }
}
