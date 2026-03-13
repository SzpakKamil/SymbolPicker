//
//  SPDictionaryPadding.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

fileprivate struct SPDictionaryPadding: ViewModifier {
    let paddings: [Edge.Set: CGFloat?]
    let verticalDefault: CGFloat
    let horizontalDefault: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(.top, paddings.spResolve(.top, axis: .vertical, defaultValue: verticalDefault))
            .padding(.bottom, paddings.spResolve(.bottom, axis: .vertical, defaultValue: verticalDefault))
            .padding(.leading, paddings.spResolve(.leading, axis: .horizontal, defaultValue: horizontalDefault))
            .padding(.trailing, paddings.spResolve(.trailing, axis: .horizontal, defaultValue: horizontalDefault))
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
fileprivate struct SPDictionarySafeAreaPadding: ViewModifier {
    let paddings: [Edge.Set: CGFloat?]
    let verticalDefault: CGFloat
    let horizontalDefault: CGFloat

    func body(content: Content) -> some View {
        content
            .spSmartSafeAreaPadding(.top, paddings.spResolve(.top, axis: .vertical, defaultValue: verticalDefault))
            .spSmartSafeAreaPadding(.bottom, paddings.spResolve(.bottom, axis: .vertical, defaultValue: verticalDefault))
            .spSmartSafeAreaPadding(.leading, paddings.spResolve(.leading, axis: .horizontal, defaultValue: horizontalDefault))
            .spSmartSafeAreaPadding(.trailing, paddings.spResolve(.trailing, axis: .horizontal, defaultValue: horizontalDefault))
    }
}


extension View {
    func spPaddingForDictionary(_ paddings: [Edge.Set: CGFloat?], verticalDefault: CGFloat = 0, horizontalDefault: CGFloat = 0) -> some View {
        self.modifier(SPDictionaryPadding(paddings: paddings, verticalDefault: verticalDefault, horizontalDefault: horizontalDefault))
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    func spSafeAreaPaddingForDictionary(_ paddings: [Edge.Set: CGFloat?], verticalDefault: CGFloat = 0, horizontalDefault: CGFloat = 0) -> some View {
        self.modifier(SPDictionarySafeAreaPadding(paddings: paddings, verticalDefault: verticalDefault, horizontalDefault: horizontalDefault))
    }

    @ViewBuilder
    func spSmartSafeAreaPadding(_ edge: Edge.Set, _ value: CGFloat) -> some View {
        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) {
            if value < 0 {
                self.padding(edge, value)
            } else {
                self.safeAreaPadding(edge, value)
            }
        } else {
            self.padding(edge, value)
        }
    }
}

extension Dictionary where Key == Edge.Set, Value == CGFloat? {
    fileprivate func spResolve(_ edge: Edge.Set, axis: Edge.Set, defaultValue: CGFloat) -> CGFloat {
        if let exact = self[edge], let value = exact {
            return value
        }
        if let axisVal = self[axis], let value = axisVal {
            return value
        }
        if let all = self[.all], let value = all {
            return value
        }
        return defaultValue
    }
}
