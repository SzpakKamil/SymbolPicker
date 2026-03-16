//
//  SPListStyleRow.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

extension View{
    func spListStyleRow(forceListStyle: Bool) -> some View{
        modifier(SPListStyleRow(forceListStyle: forceListStyle))
    }
}
struct SPListStyleRow: ViewModifier {
    @Environment(\.symbolPickerStyle) var style
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @State private var currentWidth: CGFloat = 0
    
    let forceListStyle: Bool
    
    private var shouldApplyStyle: Bool {
        forceListStyle && currentWidth >= 10
    }

    let detailCornerRadius: CGFloat = {
        if #available(iOS 26.0, tvOS 26.0, visionOS 26.0, *) {
            #if os(tvOS)
            return 40
            #else
            return 25
            #endif
        } else {
            return 15
        }
    }()

    func body(content: Content) -> some View {
        #if os(iOS) || os(visionOS) || os(tvOS)
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear { currentWidth = proxy.size.width }
                        .onChange(of: proxy.size.width) { newValue in
                            currentWidth = newValue
                        }
                }
            )
            .padding(.horizontal, shouldApplyStyle ? (style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize)) * 1 : 0)
            .padding(.vertical, shouldApplyStyle ? (style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize)) * 0.25 : 0)
            .background {
                if shouldApplyStyle {
                    #if os(visionOS) || os(tvOS)
                    RoundedRectangle(cornerRadius: detailCornerRadius, style: .continuous)
                        .fill(.regularMaterial)
                    #else
                    if #available(iOS 26.0, *) {
                        RoundedRectangle(cornerRadius: detailCornerRadius, style: .continuous)
                            .fill(style.displayStyle == .compact ? Color(.tertiarySystemFill) : Color(.secondarySystemGroupedBackground))
                    } else {
                        RoundedRectangle(cornerRadius: detailCornerRadius, style: .continuous)
                            .fill(Color(.secondarySystemGroupedBackground))
                    }
                    #endif
                }
            }
            .padding(.horizontal, shouldApplyStyle ? (style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize)) * 0.1 : 0)
        #else
        content
        #endif
    }

    init(forceListStyle: Bool) {
        self.forceListStyle = forceListStyle
    }
}
