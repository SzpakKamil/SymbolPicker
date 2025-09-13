//
//  SymbolPickerTranslation.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 13/09/2025.
//

import Foundation


enum SymbolPickerTranslation{
    case searchPrompt
    case close
    case colorPicker
    case title
    
    var value: String{
        switch self{
        case .title:
            if #available(iOS 15, macOS 12.0, *) {
                return String(
                    localized: "SymbolPickerTranslation.Title",
                    defaultValue: "Icons",
                    bundle: Bundle.module
                )
            } else {
                return NSLocalizedString("SymbolPickerTranslation.Title", bundle: .module, value: "Icons", comment: "Title for Symbol Picker")
            }
        case .searchPrompt:
            if #available(iOS 15, macOS 12.0, *) {
                return String(
                    localized: "SymbolPickerTranslation.SearchPrompt",
                    defaultValue: "Search Symbols",
                    bundle: Bundle.module
                )
            } else {
                return NSLocalizedString("SymbolPickerTranslation.SearchPrompt", bundle: .module, value: "Search Symbols", comment: "Default Prompt for SearchBar")
            }
        case .colorPicker:
            if #available(iOS 15, macOS 12.0, *) {
                return String(
                    localized: "SymbolPickerTranslation.ColorPicker",
                    defaultValue: "Color Picker",
                    bundle: Bundle.module
                )
            } else {
                return NSLocalizedString("SymbolPickerTranslation.ColorPicker", bundle: .module, value: "Color Picker", comment: "Custom Color Picker for Symbols")
            }
        case .close:
            if #available(iOS 15, macOS 12.0, *) {
                return String(
                    localized: "SymbolPickerTranslation.Close",
                    defaultValue: "Close",
                    bundle: Bundle.module
                )
            } else {
                return NSLocalizedString("SymbolPickerTranslation.Close", bundle: .module, value: "Close", comment: "Text for Close Button")
            }
        }
    }
}
