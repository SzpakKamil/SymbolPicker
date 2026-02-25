//
//  DictionaryPadding.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 25/02/2026.
//

import SwiftUI

fileprivate struct DictionaryPadding: ViewModifier {
    let paddings: [Edge.Set: CGFloat?]
    let verticalDefault: CGFloat
    let horizontalDefault: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(.top, paddings.resolve(.top, axis: .vertical, defaultValue: verticalDefault))
            .padding(.bottom, paddings.resolve(.bottom, axis: .vertical, defaultValue: verticalDefault))
            .padding(.leading, paddings.resolve(.leading, axis: .horizontal, defaultValue: horizontalDefault))
            .padding(.trailing, paddings.resolve(.trailing, axis: .horizontal, defaultValue: horizontalDefault))
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
fileprivate struct DictionarySafeAreaPadding: ViewModifier {
    let paddings: [Edge.Set: CGFloat?]
    let verticalDefault: CGFloat
    let horizontalDefault: CGFloat

    func body(content: Content) -> some View {
        content
            .smartSafeAreaPadding(.top, paddings.resolve(.top, axis: .vertical, defaultValue: verticalDefault))
            .smartSafeAreaPadding(.bottom, paddings.resolve(.bottom, axis: .vertical, defaultValue: verticalDefault))
            .smartSafeAreaPadding(.leading, paddings.resolve(.leading, axis: .horizontal, defaultValue: horizontalDefault))
            .smartSafeAreaPadding(.trailing, paddings.resolve(.trailing, axis: .horizontal, defaultValue: horizontalDefault))
    }
}


extension View {
    func paddingForDictionary(_ paddings: [Edge.Set: CGFloat?], verticalDefault: CGFloat = 0, horizontalDefault: CGFloat = 0) -> some View {
        self.modifier(DictionaryPadding(paddings: paddings, verticalDefault: verticalDefault, horizontalDefault: horizontalDefault))
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    func safeAreaPaddingForDictionary(_ paddings: [Edge.Set: CGFloat?], verticalDefault: CGFloat = 0, horizontalDefault: CGFloat = 0) -> some View {
        self.modifier(DictionarySafeAreaPadding(paddings: paddings, verticalDefault: verticalDefault, horizontalDefault: horizontalDefault))
    }

    @ViewBuilder
    func smartSafeAreaPadding(_ edge: Edge.Set, _ value: CGFloat) -> some View {
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
    fileprivate func resolve(_ edge: Edge.Set, axis: Edge.Set, defaultValue: CGFloat) -> CGFloat {
        // 1. Check specific edge (e.g., .top)
        if let exact = self[edge], let value = exact {
            return value
        }
        // 2. Check axis (e.g., .vertical)
        if let axisVal = self[axis], let value = axisVal {
            return value
        }
        // 3. Check .all
        if let all = self[.all], let value = all {
            return value
        }
        // 4. Fallback to provided default
        return defaultValue
    }
}
