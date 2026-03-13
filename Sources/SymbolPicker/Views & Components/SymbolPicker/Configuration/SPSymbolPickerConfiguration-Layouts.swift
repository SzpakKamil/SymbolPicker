//
//  SPSymbolPickerConfiguration-Layouts.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

@MainActor
public extension SPSymbolPickerConfiguration {
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
                SPInsetedView(placement: .toolbarBottomTralling, spacing: spacing) {
                    SPSelectedSymbol()
                }
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
                if #available(iOS 26.0, *) {
                    SPInsetedView(placement: .safeAreaTop) {
                        SPSelectedSymbol()
                    }
                    if colorPicker != nil {
                        SPInsetedView(placement: .scrollContentTop) {
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop) {
                        SPPagePicker()
                            .padding(.vertical, 8)
                            .padding(.horizontal, -5)
                        SPSearchBar()
                    }
                } else {
                    SPInsetedView(placement: .scrollContentTop) {
                        SPSelectedSymbol()
                    }
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
                        SPPagePicker()
                            .padding(.vertical, 8)
                            .padding(.horizontal, -5)
                        SPSearchBar()
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
                .spPadding(.bottom, value: 3)
                .spBackground { Rectangle().fill(.bar).ignoresSafeArea() }
                
                SPInsetedView(placement: .safeAreaBottom) {
                    SPSearchBar()
                }
                .spPadding(.top, value: 3)
                .spBackground { Rectangle().fill(.bar).ignoresSafeArea() }
            }
            #elseif os(visionOS)
            if displayStyle == .detail {
                if #available(visionOS 26.0, *) {
                    SPInsetedView(placement: .safeAreaTop) {
                        SPSelectedSymbol()
                    }
                    if colorPicker != nil {
                        SPInsetedView(placement: .scrollContentTop) {
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop) {
                        SPPagePicker()
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .padding(.horizontal, -3)
                        SPSearchBar()
                            .padding(.top, -8)
                            .padding(.horizontal, -3)
                    }
                } else {
                    SPInsetedView(placement: .scrollContentTop) {
                        SPSelectedSymbol()
                    }
                    if colorPicker != nil {
                        SPInsetedView(placement: .scrollContentTop) {
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop) {
                        SPPagePicker()
                            .padding(.vertical, 8)
                        SPSearchBar()
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
                        .blur(radius: 5)
                        .offset(y: -7)
                        .scaleEffect(1.01)
                }
            }
            #elseif os(tvOS)
            if displayStyle == .detail {
                if #available(tvOS 26.0, *) {
                    SPInsetedView(placement: .safeAreaTop) {
                        SPSelectedSymbol()
                    }
                    if colorPicker != nil {
                        SPInsetedView(placement: .scrollContentTop) {
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop) {
                        SPPagePicker()
                            .padding(.vertical, 25)
                        SPSearchBar()
                    }
                } else {
                    SPInsetedView(placement: .scrollContentTop) {
                        SPSelectedSymbol()
                    }
                    if colorPicker != nil {
                        SPInsetedView(placement: .scrollContentTop) {
                            SPColorPicker()
                                .padding(.vertical, 10)
                        }
                    }
                    SPInsetedView(placement: .scrollSectionTop) {
                        SPPagePicker()
                            .padding(.vertical, 8)
                        SPSearchBar()
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
            if displayStyle == .detail {
                SPInsetedView(placement: .safeAreaTop) {
                    SPSelectedSymbol()
                }
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
