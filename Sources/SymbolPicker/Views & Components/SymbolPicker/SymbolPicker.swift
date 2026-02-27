//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public struct SymbolPicker<C: SPSymbolPickerConfiguration>: View {
    @Binding private var selection: SPSelection
    @State var pageType = SPPageType.emoji
    @State var searchText: String = ""
    var style: C
    
    var isDisplayedAsPopover: Bool{
        #if os(iOS)
        UIDevice.current.userInterfaceIdiom == .pad && [SPPresentationConfiguration.DisplayType.popover, .default].contains(style.presentation.presentationType)
        #else
        [SPPresentationConfiguration.DisplayType.popover, .default].contains(style.presentation.presentationType)
        #endif
    }
    public var body: some View {
        viewContainer{
            SPOptionList()
        }
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
    
    
    @ViewBuilder
    func viewContainer(@ViewBuilder view: () -> some View) -> some View{
        #if os(iOS)
        if #available(iOS 26.0, *), style.displayStyle == .compact, !isDisplayedAsPopover{
            NavigationStack{
                view()
                    .searchable(text: $searchText, placement: .toolbarPrincipal)
                    .ignoresSafeArea(edges: .top)
            }
        }else{
            view()
        }
        #else
        view()
        #endif
    }
    
    public init(selection: Binding<SPSelection>, configuration: C) {
        self._selection = selection
        self.style = configuration
    }
}

extension SymbolPicker where C == SPSymbolPickerDefaultConfiguration {
    public init(selection: Binding<SPSelection>) {
        self._selection = selection
        self.style = SPSymbolPickerDefaultConfiguration()
    }
    
    public init(selection: Binding<SPSelection?>) {
        self._selection = Binding {
            selection.wrappedValue ?? .color(value: CKColor(hexString: "#0000"))
        } set: { newValue in
            selection.wrappedValue = newValue
        }
        self.style = SPSymbolPickerDefaultConfiguration()
    }
}

