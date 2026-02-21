//
//  SPColorPickerModifiers.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 21/02/2026.
//

import SwiftUI
import ColorKit

public extension SPColorPicker{
    func spColorPickerColors(_ colors: [CKColor]) -> Self{
        var view = self
        view.style.colors = colors
        return view
    }
    func spColorPickerColors(_ colors: CKColor...) -> Self{
        var view = self
        view.style.colors = colors
        return view
    }
    func spColorPickerSupportOpacity(_ condition: Bool = false) -> Self{
        var view = self
        view.style.allowCustomColor = condition
        return view
    }
    func spColorPickerAllowCustomColor(_ condition: Bool = true) -> Self{
        var view = self
        view.style.allowCustomColor = condition
        return view
    }
    func spColorPickerLayoutSize(_ size: CGFloat, dynamicTypeSize: DynamicTypeSize) -> Self{
        var view = self
        view.style.sizes[dynamicTypeSize] = size
        return view
    }
    func spColorPickerDirection(_ layout: Direction? = nil, spacing: CGFloat? = nil) -> Self{
        var view = self
        #if os(tvOS) || os(macOS)
        view.style.type = layout ?? .row
        #else
        view.style.type = layout ?? .grid
        #endif
        view.style.spacing = spacing
        return view
    }
}
