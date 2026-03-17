//
//  SymbolPickerConfiguration-InsetViewsConfiguration.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

@MainActor
public extension SymbolPickerConfiguration {
    @SPInsetedViewBuilder
    internal static func defaultInsetViews(for displayStyle: SPDisplayStyle, colorPicker: SPColorPickerConfiguration?) -> [SPInsetedView] {
        if displayStyle != .plain {
            #if os(tvOS)
            let spacing: CGFloat = 25
            #elseif os(macOS)
            let spacing: CGFloat = 10
            #else
            let spacing: CGFloat = 5
            #endif
            
            #if os(watchOS)
            if displayStyle == .detail {
                SPInsetedView(placement: .toolbarBottomLeading, spacing: spacing) {
                    SPPagePicker()
                }
                SPSelectionPreview().asInsetView()
                SPInsetedView(placement: .scrollContentTop, spacing: spacing) {
                    SPSearchBar()
                }
                SPInsetedView(placement: .toolbarTopTralling) {
                    SPColorPicker()
                }
            } else {
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
                SPSelectionPreview().asInsetView()
                if #available(iOS 26.0, *) {
                    if colorPicker != nil {
                        SPInsetedView(placement: .scrollContentTop) {
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop) {
                        VStack{
                            SPPagePicker()
                                .padding(.horizontal, -5)
                                .padding(.bottom, 8)
                            SPSearchBar()
                        }
                        .padding(.top, 10)
                    }
                } else {
                    if #unavailable(iOS 26.0){
                        SPInsetedView(placement: .toolbarTopTralling) {
                            SPDismissButton()
                        }
                    }
                    if colorPicker != nil {
                        SPInsetedView(placement: .scrollContentTop) {
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop) {
                        VStack{
                            SPPagePicker()
                                .padding(.bottom, 4)
                                .padding(.horizontal, -5)
                            SPSearchBar()
                                .padding(.top, 4)
                        }
                        .padding(.top, 8)
                    }
                }
            } else if #available(iOS 26.0, *) {
                SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                    if colorPicker != nil {
                        SPColorPicker()
                    }
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        SPSearchBar()
                            .padding(.horizontal, -23)
                            .padding(.bottom, 3)
                            .padding(.top, -4)
                    }
                    SPPagePicker()
                }
            } else {
                SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                    if colorPicker != nil {
                        SPColorPicker()
                    }
                    SPPagePicker()
                }
                .spPadding(.bottom, value: 8)
                .spBackground { Rectangle().fill(.bar).ignoresSafeArea().shadow(radius: 1) }
                
                if #unavailable(iOS 16.4){
                    SPInsetedView(placement: .toolbarTopTralling) {
                        SPDismissButton()
                    }
                }
                SPSearchBar().asInsetView()
            }
            #elseif os(visionOS)
            if displayStyle == .detail {
                SPSelectionPreview().asInsetView()
                if #available(visionOS 26.0, *) {
                    if colorPicker != nil {
                        SPInsetedView(placement: .scrollContentTop) {
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop) {
                        VStack{
                            SPPagePicker()
                                .padding(.bottom, 10)
                                .padding(.horizontal, -3)
                            SPSearchBar()
                                .padding(.top, -8)
                                .padding(.bottom, -3)
                                .padding(.horizontal, -3)
                        }
                        .padding(.top, 13)
                    }
                } else {
                    if colorPicker != nil {
                        SPInsetedView(placement: .scrollContentTop) {
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop) {
                        VStack{
                            SPPagePicker()
                                .padding(.bottom, 2)
                            SPSearchBar()
                        }
                        .padding(.top, 8)
                    }
                }
            } else {
                SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                    if colorPicker != nil {
                        SPColorPicker()
                    }
                    SPSearchBar()
                    SPPagePicker()
                }
                .spBackground {
                    Rectangle()
                        .fill(.bar)
                        .mask {
                            LinearGradient(
                                stops: [
                                    .init(color: .white, location: 0.8),
                                    .init(color: .clear, location: 1.0)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }
                        .blur(radius: 5)
                        .offset(y: 0)
                        .scaleEffect(1.5)
                }
            }
            #elseif os(tvOS)
            if displayStyle == .detail {
                SPSelectionPreview().asInsetView()
                if #available(tvOS 26.0, *) {
                    if colorPicker != nil {
                        SPInsetedView(placement: .scrollContentTop) {
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop) {
                        VStack{
                            SPPagePicker()
                                .padding(.bottom, 25)
                            SPSearchBar()
                        }
                        .padding(.top, 25)
                    }
                } else {
                    if colorPicker != nil {
                        SPInsetedView(placement: .scrollContentTop) {
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop) {
                        VStack{
                            SPPagePicker()
                                .padding(.bottom, 8)
                            SPSearchBar()
                        }
                        .padding(.top, 10)
                    }
                }
            } else {
                if #available(tvOS 26.0, *) {
                    SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                        if colorPicker != nil {
                            SPColorPicker()
                        }
                        SPSearchBar()
                        SPPagePicker()
                    }
                    .spBackground {
                        SPBlurTvOS()
                    }
                } else {
                    SPInsetedView(placement: .scrollContentTop) {
                        if colorPicker != nil {
                            SPColorPicker()
                                .padding(.top, 5)
                        }
                    }
                    SPInsetedView(placement: .scrollContentTop) {
                        SPSearchBar()
                        SPPagePicker()
                    }
                }
            }
            #else
            if #available(macOS 26.0, *){
                if displayStyle == .detail {
                    SPSelectionPreview().asInsetView()
                    SPInsetedView(placement: .scrollSectionTop, spacing: spacing) {
                        if colorPicker != nil {
                            SPColorPicker()
                        }
                        SPSearchBar()
                        SPPagePicker()
                    }
                } else {
                    SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                        if colorPicker != nil {
                            SPColorPicker()
                        }
                        SPSearchBar()
                        SPPagePicker()
                    }
                }
            }else{
                if displayStyle == .detail {
                    SPInsetedView(placement: .scrollSectionTop, spacing: spacing) {
                        SPSelectionPreview()
                        if colorPicker != nil {
                            SPColorPicker()
                        }
                        SPSearchBar()
                        SPPagePicker()
                    }
                } else {
                    SPInsetedView(placement: .safeAreaTop, spacing: spacing) {
                        if colorPicker != nil {
                            SPColorPicker()
                        }
                        SPSearchBar()
                        SPPagePicker()
                    }
                    .spBackground{
                        Rectangle()
                            .fill(.regularMaterial)
                            .scaleEffect(1.15)
                            .shadow(radius: 1)
                    }
                }
            }

            #endif
        }
    }
    
    internal func getViews(for type: SPViewPlacementType) -> [SPInsetedView] {
        insetViews.filter { $0.placement == type }
    }
    
    @ViewBuilder
    internal func getForEachViews(for type: SPViewPlacementType) -> some View {
        let items = getViews(for: type)
        ForEach(items.indices, id: \.self) { index in
            let item = items[index]
            item.view
                .background { item.background }
        }
    }
}
