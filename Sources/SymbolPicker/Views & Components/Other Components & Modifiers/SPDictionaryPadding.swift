//
//  SPDictionaryPadding.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

fileprivate struct SPDictionaryPadding: ViewModifier {
    let paddings: [Edge.Set: CGFloat?]
    let verticalDefault: [Edge.Set: CGFloat]
    let horizontalDefault: [Edge.Set: CGFloat]

    func body(content: Content) -> some View {
        content
            .padding(.top, paddings.spResolve(.top, axis: .vertical, defaultValues: verticalDefault))
            .padding(.bottom, paddings.spResolve(.bottom, axis: .vertical, defaultValues: verticalDefault))
            .padding(.leading, paddings.spResolve(.leading, axis: .horizontal, defaultValues: horizontalDefault))
            .padding(.trailing, paddings.spResolve(.trailing, axis: .horizontal, defaultValues: horizontalDefault))
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
fileprivate struct SPDictionarySafeAreaPadding: ViewModifier {
    let paddings: [Edge.Set: CGFloat?]
    let verticalDefault: [Edge.Set: CGFloat]
    let horizontalDefault: [Edge.Set: CGFloat]

    func body(content: Content) -> some View {
        content
            .spSmartSafeAreaPadding(.top, paddings.spResolve(.top, axis: .vertical, defaultValues: verticalDefault))
            .spSmartSafeAreaPadding(.bottom, paddings.spResolve(.bottom, axis: .vertical, defaultValues: verticalDefault))
            .spSmartSafeAreaPadding(.leading, paddings.spResolve(.leading, axis: .horizontal, defaultValues: horizontalDefault))
            .spSmartSafeAreaPadding(.trailing, paddings.spResolve(.trailing, axis: .horizontal, defaultValues: horizontalDefault))
    }
}


extension View {
    func spPaddingForDictionary(_ paddings: [Edge.Set: CGFloat?], verticalDefault: [Edge.Set: CGFloat] = [:], horizontalDefault: [Edge.Set: CGFloat] = [:]) -> some View {
        self.modifier(SPDictionaryPadding(paddings: paddings, verticalDefault: verticalDefault, horizontalDefault: horizontalDefault))
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    func spSafeAreaPaddingForDictionary(_ paddings: [Edge.Set: CGFloat?], verticalDefault: [Edge.Set: CGFloat] = [:], horizontalDefault: [Edge.Set: CGFloat] = [:]) -> some View {
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
    fileprivate func spResolve(_ edge: Edge.Set, axis: Edge.Set, defaultValues: [Edge.Set: CGFloat]) -> CGFloat {
        if let exact = self[edge], let value = exact {
            return value
        }
        if let axisVal = self[axis], let value = axisVal {
            return value
        }
        if let all = self[.all], let value = all {
            return value
        }
        
        // Resolve from defaultValues dictionary
        if let exactDefault = defaultValues[edge] {
            return exactDefault
        }
        if let axisDefault = defaultValues[axis] {
            return axisDefault
        }
        if let allDefault = defaultValues[.all] {
            return allDefault
        }
        
        return 0
    }
}
