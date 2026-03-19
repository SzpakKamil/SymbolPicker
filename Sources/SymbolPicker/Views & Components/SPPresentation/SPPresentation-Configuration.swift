//
//  SPPresentation-Configuration.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public struct SPPresentationConfiguration: Sendable{
    public var presentationCornerRadius: CGFloat?
    public var presentationType: Self.DisplayType
    public var presentationDragIndicator: Visibility
    public var presentationBackgroundColor: Color
    public var presentationContentInteraction: Self.ContentInteraction
    public var presentationBackgroundInteraction: Self.BackgroundInteraction
    public var presentationDents: Set<Self.PresentationDents>
    
    public init(){
        self.presentationType = .default
        self.presentationBackgroundInteraction = .disabled
        self.presentationDragIndicator = .visible
        self.presentationContentInteraction = .automatic
        self.presentationBackgroundColor = .clear
        self.presentationDents = {
            if #available(iOS 26.0, visionOS 26.0, tvOS 26.0, watchOS 26.0, *){
                return [.medium, .large]
            }else{
                return [.large]
            }
        }()
    }
    
    init(style: SPDisplayStyle){
        self.presentationType = .default
        self.presentationBackgroundInteraction = .disabled
        self.presentationDents = style == .compact ? [.medium, .large] : [.large]
        self.presentationDragIndicator = .visible
        self.presentationContentInteraction = .automatic
        #if os(iOS)
        if #available(iOS 26.0, *){
            self.presentationBackgroundColor = style == .compact ? Color.clear : Color(.systemGroupedBackground)
        }else{
            self.presentationBackgroundColor = Color(.systemGroupedBackground)
        }
        #else
        self.presentationBackgroundColor = .clear
        #endif
    }
    
    
    public func spPresentationCornerRadius(_ value: CGFloat) -> Self{
        var result = self
        result.presentationCornerRadius = value
        return result
    }
    public func spPresentationType(_ value: Self.DisplayType) -> Self{
        var result = self
        result.presentationType = value
        return result
    }
    public func spPresentationDragIndicator(_ value: Visibility) -> Self{
        var result = self
        result.presentationDragIndicator = value
        return result
    }
    public func spPresentationBackgroundColor(_ value: Color) -> Self{
        var result = self
        result.presentationBackgroundColor = value
        return result
    }
    public func spPresentationContentInteraction(_ value: Self.ContentInteraction) -> Self{
        var result = self
        result.presentationContentInteraction = value
        return result
    }
    public func spPresentationBackgroundInteraction(_ value: Self.BackgroundInteraction) -> Self{
        var result = self
        result.presentationBackgroundInteraction = value
        return result
    }
    public func spPresentationDents(_ dents: Set<Self.PresentationDents>) -> Self{
        var result = self
        result.presentationDents = dents
        return result
    }
}

