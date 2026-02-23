//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public extension SymbolPicker{
    struct Configuration: Sendable{
        var allowColorSelection: Bool
        var spacing: SPSpacing
        var supportedTypes: [SPPageType]
        var defaultType: SPPageType
        var symbolVariant: SPSymbol.Variant
        var topView: SPInsetedView?
        var bottomView: SPInsetedView?
        var displayType: SPDisplayType
        var displaySize: Set<SPDisplaySize>
        
        
        public init(displayType: SPDisplayType = .default, displaySize: Set<SPDisplaySize> = [.large], topView: SPInsetedView? = nil, bottomView: SPInsetedView? = nil) {
            self.displayType = displayType
            self.displaySize = displaySize
            #if os(tvOS)
            let spacing: CGFloat = 25
            #elseif os(macOS)
            let spacing: CGFloat = 10
            #else
            let spacing: CGFloat = 5
            #endif
            self.topView = topView ?? .init(inset: .safeArea, spacing: spacing){
                SPColorPicker()
                    .spColorPickerDirection(displayType == .default || displayType == .popover ? .row : .grid)
                SPPagePicker()
            }
            self.bottomView = bottomView
            self.allowColorSelection = true
            self.symbolVariant = .filled
            self.spacing = SPSpacing()
            self.supportedTypes = SPPageType.allCases
            self.defaultType = .symbol
        }

    }
    
    

}



