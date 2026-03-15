//
//  SPOptionList-Configuration.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 15/03/2026.
//

import SwiftUI

public struct SPOptionListConfiguration: Sendable {
    public var optionListCornerRadiusFactor: CGFloat
    public var optionListInnerPaddingFactor: CGFloat
    
    public var optionListForeground: Color
    public var optionListForegroundSelected: Color
    public var optionListForegroundFocused: Color
    public var optionListForegroundPressed: Color
    
    public var optionListBackground: Color
    public var optionListBackgroundSelected: Color
    public var optionListBackgroundFocused: Color
    public var optionListBackgroundPressed: Color

    public init() {
        #if os(watchOS) || os(visionOS)
        self.optionListCornerRadiusFactor = 0.45
        #else
        self.optionListCornerRadiusFactor = 0.25
        #endif
        self.optionListInnerPaddingFactor = 0.30
        self.optionListForeground = .primary
        self.optionListForegroundSelected = .primary
        self.optionListForegroundFocused = .primary
        self.optionListForegroundPressed = .primary
        
        self.optionListBackground = .clear
        
        #if os(tvOS)

        self.optionListBackgroundFocused = Color.primary.opacity(0.15)
        if #available(tvOS 26.0, *){
            self.optionListBackgroundSelected = Color.primary.opacity(0.3)
        }else{
            self.optionListBackgroundSelected = Color.primary.opacity(0.4)
        }

        self.optionListBackgroundPressed = .clear
        #elseif os(iOS)
        self.optionListBackgroundSelected = Color.primary.opacity(0.15)
        self.optionListBackgroundPressed = Color.primary.opacity(0.10)
        self.optionListBackgroundFocused = Color.primary.opacity(0.15)
        #else
        self.optionListBackgroundSelected = Color.primary.opacity(0.20)
        self.optionListBackgroundPressed = Color.primary.opacity(0.10)
        self.optionListBackgroundFocused = Color.primary.opacity(0.20)
        #endif
    }
    
    init(style: SPDisplayStyle) {
        self.init()
    }
    
    public func spOptionListCornerRadiusFactor(_ value: CGFloat) -> Self {
        var result = self
        result.optionListCornerRadiusFactor = value
        return result
    }
    
    public func spOptionListInnerPaddingFactor(_ value: CGFloat) -> Self {
        var result = self
        result.optionListInnerPaddingFactor = value
        return result
    }
    
    
    public func spOptionListForeground(_ value: Color) -> Self {
        var result = self
        result.optionListForeground = value
        return result
    }
    
    public func spOptionListForegroundSelected(_ value: Color) -> Self {
        var result = self
        result.optionListForegroundSelected = value
        return result
    }
    
    public func spOptionListForegroundFocused(_ value: Color) -> Self {
        var result = self
        result.optionListForegroundFocused = value
        return result
    }
    
    public func spOptionListForegroundPressed(_ value: Color) -> Self {
        var result = self
        result.optionListForegroundPressed = value
        return result
    }
    
    public func spOptionListBackground(_ value: Color) -> Self {
        var result = self
        result.optionListBackground = value
        return result
    }
    
    public func spOptionListBackgroundSelected(_ value: Color) -> Self {
        var result = self
        result.optionListBackgroundSelected = value
        return result
    }
    
    public func spOptionListBackgroundFocused(_ value: Color) -> Self {
        var result = self
        result.optionListBackgroundFocused = value
        return result
    }
    
    public func spOptionListBackgroundPressed(_ value: Color) -> Self {
        var result = self
        result.optionListBackgroundPressed = value
        return result
    }
}
