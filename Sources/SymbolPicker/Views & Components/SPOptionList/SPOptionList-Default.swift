//
//  SPOptionList-Default.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 15/03/2026.
//

import SwiftUI

@MainActor
public extension SymbolPickerConfiguration {
    func optionListConfiguration() -> SPOptionListConfiguration { return .init() }
    
    var optionList: SPOptionListConfiguration { optionListConfiguration() }
}
