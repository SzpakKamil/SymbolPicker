//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public struct SymbolPicker: View {
    @Binding private var selection: SPSelection
    @State var pageType = SPPageType.emoji
    var style = Configuration()
    public var body: some View {
        SPOptionList()
            .onAppear{
                pageType = style.defaultType
            }
            .environment(\.spSymbolVariant, style.symbolVariant)
            .environment(\.spPageType, $pageType)
            .environment(\.spSelection, $selection)
            .environment(\.symbolPickerStyle, style)
    }
    
    public init(selection: Binding<SPSelection?>) {
        self._selection = Binding{
            selection.wrappedValue ?? .color(value: CKColor(hexString: "#0000"))
        }set: { newValue in
            selection.wrappedValue = newValue
        }
    }
    public init(selection: Binding<SPSelection>, configuration: SymbolPicker.Configuration? = nil) {
        self._selection = selection
        self.style = configuration ?? Configuration()
    }
}


