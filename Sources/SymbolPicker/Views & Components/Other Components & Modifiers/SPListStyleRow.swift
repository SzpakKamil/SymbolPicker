//
//  SPListStyleRow.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 27/02/2026.
//

import SwiftUI

extension View{
    func spListStyleRow(forceListStyle: Bool) -> some View{
        modifier(SPListStyleRow(forceListStyle: forceListStyle))
    }
}
struct SPListStyleRow: ViewModifier{
    @Environment(\.symbolPickerStyle) var style
    let forceListStyle: Bool
    let detailCornerRadius: CGFloat = {
        if #available(iOS 26.0, *){
            25
        }else{
            15
        }
    }()
    func body(content: Content) -> some View {
        #if os(iOS)
        content
            .padding(.horizontal, forceListStyle ? (SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0) * 1 : 0)
            .padding(.vertical, forceListStyle ? (SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0) * 0.25 : 0)
            .background{
                if forceListStyle{
                    RoundedRectangle(cornerRadius: detailCornerRadius, style: .continuous).fill(style.displayStyle == .compact ? Color(.tertiarySystemFill) : Color(.secondarySystemGroupedBackground))}
                }
            .padding(.horizontal, forceListStyle ? (SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0) * 0.1 : 0)
        #else
        content
        #endif
    }
    
    init(forceListStyle: Bool) {
        self.forceListStyle = forceListStyle
    }
}
