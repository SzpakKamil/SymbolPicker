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
        Picker("Page Type", selection: spPageType) {
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
    }
    
    public init() {}
}
