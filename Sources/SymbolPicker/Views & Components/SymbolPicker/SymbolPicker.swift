//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public struct SymbolPicker<C: SPSymbolPickerConfiguration>: View {
    @State private var displaySize: SPDisplaySize
    @Binding private var selection: SPSelection
    @State var pageType = SPPageType.emoji
    @State var searchText: String = ""
    var style: C
    public var body: some View {
        SPOptionList()
            #if os(watchOS)
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing) {
                    style.getForEachViews(for: .toolbarTopTralling)
                }
                ToolbarItem(placement: .bottomBar) {
                    let bottomBarLeadingItems = style.getViews(for: .toolbarBottomLeading).count
                    if bottomBarLeadingItems == 0{
                        Button(""){}.buttonStyle(.plain)
                    }else{
                        style.getForEachViews(for: .toolbarBottomLeading)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    let bottomBarItems = style.getViews(for: .toolbarBottom).count
                    if bottomBarItems == 0{
                        Button(""){}.buttonStyle(.plain)
                    }else{
                        style.getForEachViews(for: .toolbarBottom)
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    let bottomBarTrailingItems = style.getViews(for: .toolbarBottomTralling).count
                    if bottomBarTrailingItems == 0{
                        Button(""){}.buttonStyle(.plain)
                    }else{
                        style.getForEachViews(for: .toolbarBottomTralling)
                    }
                }
            }
            #endif
            .onAppear{
                pageType = style.defaultType
            }
            .environment(\.spSearchText, $searchText)
            .environment(\.spSymbolVariant, style.symbolVariant)
            .environment(\.spPageType, $pageType)
            .environment(\.spSelection, $selection)
            .environment(\.symbolPickerStyle, style)
    }
    
    public init(selection: Binding<SPSelection>, configuration: C) {
        self._selection = selection
        self.style = configuration
        self.displaySize = style.displaySize.first ?? .large
    }
}

extension SymbolPicker where C == SPSymbolPickerDefaultConfiguration {
    public init(selection: Binding<SPSelection>) {
        self._selection = selection
        self.style = SPSymbolPickerDefaultConfiguration()
        self.displaySize = style.displaySize.first ?? .large
    }
    
    public init(selection: Binding<SPSelection?>) {
        self._selection = Binding {
            selection.wrappedValue ?? .color(value: CKColor(hexString: "#0000"))
        } set: { newValue in
            selection.wrappedValue = newValue
        }
        self.style = SPSymbolPickerDefaultConfiguration()
        self.displaySize = style.displaySize.first ?? .large
    }
}

