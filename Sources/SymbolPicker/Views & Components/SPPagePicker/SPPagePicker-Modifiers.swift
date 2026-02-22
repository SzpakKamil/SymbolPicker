//
//  SPPagePicker-Configuration.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import Foundation

public extension SPPagePicker{
    func spSupportedTypes(_ types: [SPPageType] = SPPageType.allCases) -> Self{
        var view = self
        view.style.supportedTypes = types
        return view
    }
    func spSupportedTypes(_ types: SPPageType...) -> Self{
        var view = self
        view.style.supportedTypes = types
        return view
    }
}
