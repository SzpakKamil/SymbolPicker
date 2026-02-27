//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public protocol SPSymbolPickerConfiguration: Sendable {
    func presentationConfiguration() -> SPPresentationConfiguration
    func colorPickerConfiguration() -> SPColorPickerConfiguration?
    @SPInsetedViewBuilder func insetViewsConfiguration() -> [SPInsetedView]
    var spacing: SPSpacing { get }
    var symbolVariant: SPSymbol.Variant { get }
    var supportedTypes: [SPPageType] { get }
    var defaultType: SPPageType { get }
    var displayStyle: SPDisplayStyle { get }
    
    

    func getCellButtonStyle(isSelected: Bool, isFocused: Bool, size: CGFloat) -> SPAnyCellButtonStyle
}

public extension SPSymbolPickerConfiguration {
    func colorPickerConfiguration() -> SPColorPickerConfiguration?{
        return .init(style: displayStyle)
    }
    func presentationConfiguration() -> SPPresentationConfiguration{
        return .init(style: displayStyle)
    }
    @SPInsetedViewBuilder func insetViewsConfiguration() -> [SPInsetedView]{
        #if os(tvOS)
        let spacing: CGFloat = 25
        #elseif os(macOS)
        let spacing: CGFloat = 10
        #else
        let spacing: CGFloat = 5
        #endif
        #if os(watchOS)
        return [SPInsetedView(placement: .toolbarBottomLeading, spacing: spacing) {
            SPPagePicker()
        },
        SPInsetedView(placement: .scrollContentTop, spacing: spacing) {
            SPSearchBar()
        },
                SPInsetedView(placement: .toolbarTopTralling) {
            SPColorPicker()
        }]
        #elseif os(iOS)
        if displayStyle == .detail {
            return [
                SPInsetedView(placement: .scrollContentTop){
                    SPColorPicker()
                        .padding(.vertical, 10)
                },
                SPInsetedView(placement: .scrollSectionTop){
                    SPPagePicker()
                    .padding(.vertical, 8)
                    .padding(.horizontal, -5)
                    SPSearchBar()
                }
            ]
        }else{
            return [SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                SPColorPicker()
                SPPagePicker()
            }]
        }
        #else
        return [SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
            SPColorPicker()
            SPPagePicker()
        }]
        #endif
    }
    
    var spacing: SPSpacing { SPSpacing() }
    var symbolVariant: SPSymbol.Variant { .filled }
    var supportedTypes: [SPPageType] { SPPageType.allCases }
    var defaultType: SPPageType { .symbol }
    var displayStyle: SPDisplayStyle {
        if #available(iOS 26.0, visionOS 26.0, tvOS 26.0, watchOS 26.0, *){
            return .compact
        }else{
            return .detail
        }
    }
    
    func getCellButtonStyle(isSelected: Bool, isFocused: Bool, size: CGFloat) -> SPAnyCellButtonStyle{
        return .init(SPOptionListButtonStyle(isSelected: isSelected, isFocused: isFocused, size: size))
    }

    var colorPicker: SPColorPickerConfiguration? { colorPickerConfiguration() }
    var presentation: SPPresentationConfiguration { presentationConfiguration() }
    var insetViews: [SPInsetedView] { insetViewsConfiguration() }
    
    
    func getViews(for type: SPViewPlacementType) -> [SPInsetedView]{
        insetViews.filter{ $0.placement == type }
    }
    
    @ViewBuilder
    func getForEachViews(for type: SPViewPlacementType) -> some View{
        let items = getViews(for: type)
        ForEach(items.indices, id: \.self){ index in
            items[index].view
        }
    }
}

public struct SPSymbolPickerDefaultConfiguration: SPSymbolPickerConfiguration {
    public var currentPresentationConfiguration: @Sendable () -> SPPresentationConfiguration
    public func presentationConfiguration() -> SPPresentationConfiguration { self.currentPresentationConfiguration() }
    public var currentColorPickerConfiguration: @Sendable () -> SPColorPickerConfiguration?
    public func colorPickerConfiguration() -> SPColorPickerConfiguration? { self.currentColorPickerConfiguration() }
    public var currentInsetViewConfiguration: @Sendable () -> [SPInsetedView]
    public func insetViewsConfiguration() -> [SPInsetedView] { return self.currentInsetViewConfiguration() }
    
    public var symbolVariant: SPSymbol.Variant = .filled
    public var supportedTypes: [SPPageType] = SPPageType.allCases
    public var defaultType: SPPageType = .symbol
    public var displayStyle: SPDisplayStyle
 


    public init() {
        if #available(iOS 26.0, visionOS 26.0, tvOS 26.0, watchOS 26.0, *){
            self.displayStyle = .compact
        }else{
            self.displayStyle = .detail
        }
        let displayStyle = self.displayStyle
        self.currentPresentationConfiguration = { SPPresentationConfiguration(style: displayStyle) }
        self.currentColorPickerConfiguration = { SPColorPickerConfiguration(style: displayStyle) }
        self.currentInsetViewConfiguration = {
            #if os(tvOS)
            let spacing: CGFloat = 25
            #elseif os(macOS)
            let spacing: CGFloat = 10
            #else
            let spacing: CGFloat = 5
            #endif
            #if os(watchOS)
            return [SPInsetedView(placement: .toolbarBottomLeading, spacing: spacing) {
                SPPagePicker()
            },
            SPInsetedView(placement: .scrollContentTop, spacing: spacing) {
                SPSearchBar()
            },
                    SPInsetedView(placement: .toolbarTopTralling) {
                SPColorPicker()
            }]
            #elseif os(iOS)
            if displayStyle == .detail {
                return [
                    SPInsetedView(placement: .scrollContentTop){
                        SPColorPicker()
                            .padding(.vertical, 10)
                    },
                    SPInsetedView(placement: .scrollSectionTop){
                        SPPagePicker()
                        .padding(.vertical, 8)
                        .padding(.horizontal, -5)
                        SPSearchBar()
                    }
                ]
            }else{
                return [SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                    SPColorPicker()
                    SPPagePicker()
                }]
            }
            #else
            return [SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                SPColorPicker()
                SPPagePicker()
            }]
            #endif
        }
    }
}
