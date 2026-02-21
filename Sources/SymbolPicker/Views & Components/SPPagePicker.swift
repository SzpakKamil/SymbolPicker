//
//  SPPagePicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 14/02/2026.
//

import SwiftUI
import ColorKit

public struct SPPagePicker: SPComponent {
    @Environment(\.spPageType) var spPageType
    var pageTypes: [SPPageType] = SPPageType.allCases
    public var body: some View{
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
            ForEach(pageTypes){
                #if !os(macOS)
                Text($0.localizedDescription)
                    .tag($0)
                #else
                Text("     \($0.localizedDescription)    ")
                    .tag($0)
                #endif
            }
        }
        .labelsHidden()
        #if !os(watchOS)
        .pickerStyle(.segmented)
        #endif
        #endif
    }
    
    public init() {}
}
