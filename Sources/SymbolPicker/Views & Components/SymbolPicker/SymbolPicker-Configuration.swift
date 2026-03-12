//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public protocol SPSymbolPickerConfiguration: Sendable {
    @MainActor
    func presentationConfiguration() -> SPPresentationConfiguration
    @MainActor
    func colorPickerConfiguration() -> SPColorPickerConfiguration?
    @MainActor
    @SPInsetedViewBuilder func insetViewsConfiguration() -> [SPInsetedView]
    @MainActor
    var spacing: SPSpacing { get }
    @MainActor
    var symbolVariant: SPSymbol.Variant { get }
    @MainActor
    var supportedTypes: [SPPageType] { get }
    @MainActor
    var defaultType: SPPageType { get }
    @MainActor
    var displayStyle: SPDisplayStyle { get }
}

@MainActor
public extension SPSymbolPickerConfiguration {
    func colorPickerConfiguration() -> SPColorPickerConfiguration?{
        return .init(style: displayStyle)
    }
    func presentationConfiguration() -> SPPresentationConfiguration{
        return .init(style: displayStyle)
    }
    
    @SPInsetedViewBuilder
    internal static func defaultInsetViews(for displayStyle: SPDisplayStyle, colorPicker: SPColorPickerConfiguration?) -> [SPInsetedView]{
        if displayStyle != .plain{
            #if os(tvOS)
            let spacing: CGFloat = 25
            #elseif os(macOS)
            let spacing: CGFloat = 10
            #else
            let spacing: CGFloat = 5
            #endif
            #if os(watchOS)
            if displayStyle == .detail{
                SPInsetedView(placement: .toolbarBottomLeading, spacing: spacing) {
                    SPPagePicker()
                }
                SPInsetedView(placement: .toolbarBottomTralling, spacing: spacing) {
                    SPSelectedSymbol()
                }
                SPInsetedView(placement: .scrollContentTop, spacing: spacing) {
                    SPSearchBar()
                }
                SPInsetedView(placement: .toolbarTopTralling) {
                    SPColorPicker()
                }
            }else{
                SPInsetedView(placement: .toolbarBottomLeading, spacing: spacing) {
                    SPPagePicker()
                }
                SPInsetedView(placement: .scrollContentTop, spacing: spacing) {
                    SPSearchBar()
                }
                SPInsetedView(placement: .toolbarTopTralling) {
                    SPColorPicker()
                }
            }
            #elseif os(iOS)
            if displayStyle == .detail {
                if #available(iOS 26.0, *){
                    SPInsetedView(placement: .safeAreaTop){
                        SPSelectedSymbol()
                    }
                    if colorPicker != nil{
                        SPInsetedView(placement: .scrollContentTop){
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop){
                        SPPagePicker()
                            .padding(.vertical, 8)
                            .padding(.horizontal, -5)
                        SPSearchBar()
                    }
                }else{
                    SPInsetedView(placement: .scrollContentTop){
                        SPSelectedSymbol()
                    }
                    if colorPicker != nil{
                        SPInsetedView(placement: .scrollContentTop){
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop){
                        SPPagePicker()
                            .padding(.vertical, 8)
                            .padding(.horizontal, -5)
                        SPSearchBar()
                    }
                }
            }else if #available(iOS 26.0, *){
                SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                    if colorPicker != nil{
                        SPColorPicker()
                    }
                    if UIDevice.current.userInterfaceIdiom == .pad{
                        SPSearchBar()
                            .padding(.horizontal, -23)
                            .padding(.bottom, 3)
                            .padding(.top, -4)
                    }
                    SPPagePicker()
                }
            }else{
                SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                    if colorPicker != nil{
                        SPColorPicker()
                    }
                    SPPagePicker()
                }
                .spPadding(.bottom, value: 3)
                .spBackground{ Rectangle().fill(.bar).ignoresSafeArea() }
                
                SPInsetedView(placement: .safeAreaBottom){
                    SPSearchBar()
                }
                .spPadding(.top, value: 3)
                .spBackground{ Rectangle().fill(.bar).ignoresSafeArea() }
            }
            #elseif os(visionOS)
            if displayStyle == .detail{
                if #available(visionOS 26.0, *){
                    SPInsetedView(placement: .safeAreaTop){
                        SPSelectedSymbol()
                    }
                    if colorPicker != nil{
                        SPInsetedView(placement: .scrollContentTop){
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop){
                        SPPagePicker()
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .padding(.horizontal, -3)
                        SPSearchBar()
                            .padding(.top, -8)
                            .padding(.horizontal, -3)
                    }
                }else{
                    SPInsetedView(placement: .scrollContentTop){
                        SPSelectedSymbol()
                    }
                    if colorPicker != nil{
                        SPInsetedView(placement: .scrollContentTop){
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop){
                        SPPagePicker()
                            .padding(.vertical, 8)
                        SPSearchBar()
                    }
                }
            }else{
                SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                    if colorPicker != nil{
                        SPColorPicker()
                    }
                    SPSearchBar()
                    SPPagePicker()
                }
                .spBackground{
                    Rectangle()
                        .fill(.bar)
                        .blur(radius: 5)
                        .offset(y: -7)
                        .scaleEffect(1.01)
                }
                
            }
            #elseif os(tvOS)
            if displayStyle == .detail{
                if #available(tvOS 26.0, *){
                    SPInsetedView(placement: .safeAreaTop){
                        SPSelectedSymbol()
                    }
                    if colorPicker != nil{
                        SPInsetedView(placement: .scrollContentTop){
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop){
                        SPPagePicker()
                            .padding(.vertical, 25)
                        SPSearchBar()
                    }
                }else{
                    SPInsetedView(placement: .scrollContentTop){
                        SPSelectedSymbol()
                    }
                    if colorPicker != nil{
                        SPInsetedView(placement: .scrollContentTop){
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop){
                        SPPagePicker()
                            .padding(.vertical, 8)
                        SPSearchBar()
                    }
                }
            }else{
                if #available(tvOS 26.0, *){
                    SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                        if colorPicker != nil{
                            SPColorPicker()
                        }
                        SPSearchBar()
                        SPPagePicker()
                    }
                    .spBackground{
                        SPBlurTvOS()
                    }
                    
                }else{
                    SPInsetedView(placement: .scrollContentTop){
                        if colorPicker != nil{
                            SPColorPicker()
                                .padding(.top, 5)
                        }
                    }
                    SPInsetedView(placement: .scrollContentTop){
                        SPSearchBar()
                        SPPagePicker()
                    }
                }
            }
            #else
            if displayStyle == .detail{
                SPInsetedView(placement: .safeAreaTop){
                    SPSelectedSymbol()
                }
                SPInsetedView(placement: .scrollSectionTop, spacing: spacing) {
                    if colorPicker != nil{
                        SPColorPicker()
                    }
                    SPSearchBar()
                    SPPagePicker()
                }
            }else{
                SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                    if colorPicker != nil{
                        SPColorPicker()
                    }
                    SPSearchBar()
                    SPPagePicker()
                }
            }
            #endif
        }
    }
    
    @SPInsetedViewBuilder func insetViewsConfiguration() -> [SPInsetedView]{
        Self.defaultInsetViews(for: displayStyle, colorPicker: colorPicker)
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
            let item = items[index]
            item.view
                .background { item.background }
        }
    }
}

public struct SPSymbolPickerDefaultConfiguration: SPSymbolPickerConfiguration {
    @MainActor public var currentPresentationConfiguration: @MainActor (SPDisplayStyle) -> SPPresentationConfiguration
    @MainActor public func presentationConfiguration() -> SPPresentationConfiguration { self.currentPresentationConfiguration(displayStyle) }
    @MainActor public var currentColorPickerConfiguration: @MainActor (SPDisplayStyle) -> SPColorPickerConfiguration?
    @MainActor public func colorPickerConfiguration() ->  SPColorPickerConfiguration? { self.currentColorPickerConfiguration(displayStyle) }
    @MainActor public var currentInsetViewConfiguration: @MainActor (SPDisplayStyle, SPColorPickerConfiguration?) -> [SPInsetedView]
    @MainActor public func insetViewsConfiguration() -> [SPInsetedView] { return self.currentInsetViewConfiguration(displayStyle, colorPicker) }
    
    @MainActor public var symbolVariant: SPSymbol.Variant = .filled
    @MainActor public var supportedTypes: [SPPageType] = SPPageType.allCases
    @MainActor public var defaultType: SPPageType = .symbol
    @MainActor public var displayStyle: SPDisplayStyle
 


    public init() {
        if #available(iOS 26.0, visionOS 26.0, tvOS 26.0, watchOS 26.0, *){
            self.displayStyle = .compact
        }else{
            self.displayStyle = .detail
        }
        self.currentPresentationConfiguration = { SPPresentationConfiguration(style: $0) }
        self.currentColorPickerConfiguration = { SPColorPickerConfiguration(style: $0) }
        self.currentInsetViewConfiguration = { style, colorPicker in SPSymbolPickerDefaultConfiguration.defaultInsetViews(for: style, colorPicker: colorPicker) }
    }
}

