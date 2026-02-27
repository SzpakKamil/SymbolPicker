//
//  SwiftUIView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 27/02/2026.
//

import SwiftUI

public struct SPPresentationConfiguration: Sendable{
    var presentationCornerRadius: CGFloat?
    var presentationType: Self.DisplayType
    var presentationDragIndicator: Visibility
    var presentationBackgroundColor: Color
    var presentationContentInteraction: Self.ContentInteraction
    var presentationBackgroundInteraction: Self.BackgroundInteraction
    var presentationDents: Set<Self.PresentationDents>
    
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
        self.presentationDents = [.large]
        self.presentationDragIndicator = .visible
        self.presentationContentInteraction = .automatic
        #if os(iOS)
        self.presentationBackgroundColor = style == .compact ? Color.clear : Color(.systemGroupedBackground)
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

