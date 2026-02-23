//
//  SPPagePicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 14/02/2026.
//

import SwiftUI
import ColorKit

public struct SPPagePicker: View {
    @Environment(\.spPageType) var spPageType
    @Environment(\.spHorizontalPadding) var spHorizontalPadding
    @Environment(\.symbolPickerStyle) var style
    public var body: some View{
        let supportedTypesCount = style.supportedTypes.count
        if supportedTypesCount > 1{
            #if os(watchOS)
            if spPageType.wrappedValue == .emoji{
                Button(SPPageType.symbol.localizedDescription, systemImage: SPPageType.symbol.systemName){
                    spPageType.wrappedValue = .symbol
                }
            }else{
                Button(SPPageType.emoji.localizedDescription, systemImage: SPPageType.emoji.systemName){
                    spPageType.wrappedValue = .emoji
                }
            }
            #else
            Picker(SPTranslation.PageType.localizedDescription, selection: spPageType) {
                ForEach(style.supportedTypes){
                    #if !os(macOS)
                    Text($0.localizedDescription)
                        .tag($0)
                    #else
                    if supportedTypesCount == 2{
                        Text("           \($0.localizedDescription)           ")
                            .tag($0)
                    }else{
                        Text("     \($0.localizedDescription)    ")
                            .tag($0)
                    }
                    #endif
                }
            }
            .labelsHidden()
            .pickerStyle(.segmented)
            .padding(.horizontal, spHorizontalPadding)
            #endif
        }
    }
    
    public init() {}
}
