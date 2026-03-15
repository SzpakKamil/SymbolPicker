//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public struct SymbolPicker<T: SPDataAsset, C: SymbolPickerConfiguration>: View {
    @Binding private var selection: SPSelection<T>
    @State var pageType = SPPageType.emoji
    @State var searchText: String = ""
    @State private var hasAppeared = false
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
            SPOptionList(selection: $selection)
                #if os(iOS) || os(watchOS)
                .toolbar{
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        style.getForEachViews(for: .toolbarTopTralling)
                    }
                    #if os(iOS)
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        style.getForEachViews(for: .toolbarTopLeading)
                    }
                    #endif
                    #if os(watchOS)
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
                    #endif
                }
                #endif
        }
        .onAppear{
            if !hasAppeared {
                pageType = style.defaultType
                hasAppeared = true
            }
        }
        .environment(\.spSearchText, $searchText)
        .environment(\.spSymbolVariant, style.symbolVariant)
        .environment(\.spPageType, $pageType)
        .environment(\.spSelection, $selection.eraseToAnySPSelectionProtocol())
        .environment(\.symbolPickerStyle, style)
    }
    
    
    @ViewBuilder
    func viewContainer(@ViewBuilder view: () -> some View) -> some View{
        #if os(iOS)
        if #available(iOS 26.0, *), style.displayStyle == .compact, style.getViews(for: .safeAreaBottom).isEmpty, !isDisplayedAsPopover{
            NavigationStack{
                view()
                    .searchable(
                        text: $searchText,
                        placement: .toolbarPrincipal, prompt: pageType == .symbol ? Text(SPTranslation.SearchSymbols.localizedDescription ): pageType == .emoji ? Text(SPTranslation.SearchEmojis.localizedDescription) : nil
                    )
                    .ignoresSafeArea(edges: .top)
            }
        }else if #available(iOS 16.0, *){
            NavigationStack{
                view()
                    .background(style.presentation.presentationBackgroundColor.ignoresSafeArea())
            }
        }else{
            NavigationView{
                view()
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(.top, style.getViews(for: .toolbarTopLeading).isEmpty && style.getViews(for: .toolbarTopTralling).isEmpty ? 0 : -15)
                    .background(style.presentation.presentationBackgroundColor.ignoresSafeArea())
            }
        }
        #else
        view()
        #endif
    }
    
    public init(selection: Binding<SPSelection<T>>, configuration: C) {
        self._selection = selection
        self.style = configuration
    }
}

extension SymbolPicker where C == SymbolPickerDefaultConfiguration {
    public init(selection: Binding<SPSelection<T>>) {
        self._selection = selection
        self.style = SymbolPickerDefaultConfiguration()
    }
    
    public init(selection: Binding<SPSelection<T>?>) {
        self._selection = Binding {
            selection.wrappedValue ?? .init(value: CKColor(hexString: "#0000"))
        } set: { newValue in
            selection.wrappedValue = newValue
        }
        self.style = SymbolPickerDefaultConfiguration()
    }
}
