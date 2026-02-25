//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public protocol SPSymbolPickerConfiguration: Sendable {
    var allowColorSelection: Bool { get }
    var spacing: SPSpacing { get }
    var symbolVariant: SPSymbol.Variant { get }
    var supportedTypes: [SPPageType] { get }
    var defaultType: SPPageType { get }
    var displayType: SPDisplayType { get }
    var displaySize: Set<SPDisplaySize> { get }
    
    @SPInsetedViewBuilder
    func insetViews() -> [SPInsetedView]
    
    func getCellButtonStyle(isSelected: Bool, isFocused: Bool, size: CGFloat) -> SPAnyCellButtonStyle
}

public extension SPSymbolPickerConfiguration {
    var allowColorSelection: Bool { true }
    var symbolVariant: SPSymbol.Variant { .filled }
    var spacing: SPSpacing { SPSpacing() }
    var supportedTypes: [SPPageType] { SPPageType.allCases }
    var defaultType: SPPageType { .symbol }
    var displayType: SPDisplayType { .default }
    var displaySize: Set<SPDisplaySize> { [.large] }
    
    func getCellButtonStyle(isSelected: Bool, isFocused: Bool, size: CGFloat) -> SPAnyCellButtonStyle{
        return .init(SPOptionListButtonStyle(isSelected: isSelected, isFocused: isFocused, size: size))
    }

    
    @SPInsetedViewBuilder
    func insetViews() -> [SPInsetedView] {
        #if os(tvOS)
        let spacing: CGFloat = 25
        #elseif os(macOS)
        let spacing: CGFloat = 10
        #elseif os(iOS)
        let spacing: CGFloat = 2
        #else
        let spacing: CGFloat = 5
        #endif
        #if os(watchOS)
        SPInsetedView(placement: .toolbarBottomLeading, spacing: spacing) {
            SPPagePicker()
        }
        SPInsetedView(placement: .scrollContentTop, spacing: spacing) {
            SPSearchBar()
        }
        SPInsetedView(placement: .toolbarTopTralling) {
            SPColorPicker()
        }
        #else
        SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
            SPColorPicker()
                .spColorPickerDirection(displayType == .default || displayType == .popover ? .row : .grid)
            #if !os(iOS)
            SPSearchBar()
            #endif
            SPPagePicker()
        }
        #if os(iOS)
        SPInsetedView(placement: .safeAreaBottom) {
            SPSearchBar()
                .ignoresSafeArea()
                .padding(.bottom, -10)
                .padding(.horizontal, 5)
        }
        #endif
        #endif
    }
    
    func getViews(for type: SPViewPlacementType) -> [SPInsetedView]{
        insetViews().filter{ $0.placement == type }
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
    public var allowColorSelection: Bool = true
    public var symbolVariant: SPSymbol.Variant = .filled
    public var supportedTypes: [SPPageType] = SPPageType.allCases
    public var defaultType: SPPageType = .symbol
    public var displayType: SPDisplayType = .default
    public var displaySize: Set<SPDisplaySize> = [.large]
    public var customInsetedViews: [SPInsetedView] = []

    public var insetedViews: [SPInsetedView]? {
        customInsetedViews.isEmpty ? nil : customInsetedViews
    }

    public init() {}
    
    @SPInsetedViewBuilder
    public func insetViews() -> [SPInsetedView] {
        if let insetedViews{
            return insetedViews
        }else{
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
            #else
            return [SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                SPColorPicker()
                    .spColorPickerDirection(displayType == .default || displayType == .popover ? .row : .grid)
                SPPagePicker()
            }]
            #endif
        }
    }
}
