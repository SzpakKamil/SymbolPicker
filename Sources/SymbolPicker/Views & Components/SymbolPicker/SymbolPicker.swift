//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public struct SymbolPicker<DataAsset: SPDataAsset, Configuration: SymbolPickerConfiguration>: View {
    @Binding private var selection: SPSelection<DataAsset>
    @State var pageType = SPPageType.emoji
    @State var searchText: String = ""
    @State private var hasAppeared = false
    var style: Configuration
    var allowedPageTypes: [SPPageType] = SPPageType.allCases
    var allowColorSelection: Bool = true
    
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
                if allowedPageTypes.contains(style.defaultType){
                    pageType = style.defaultType
                }else{
                    pageType = allowedPageTypes.first ?? style.defaultType
                }
                
                hasAppeared = true
            }
        }
        .environment(\.spSearchText, $searchText)
        .environment(\.spSymbolVariant, style.symbolVariant)
        .environment(\.spPageType, $pageType)
        .environment(\.spAllowsColorSelection, allowColorSelection)
        .environment(\.spAllowedPageTypes, allowedPageTypes)
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
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(.top, style.getViews(for: .toolbarTopLeading).isEmpty && style.getViews(for: .toolbarTopTralling).isEmpty ? 0 : -15)
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
    
    public init(
        selection: Binding<SPSelection<DataAsset>>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) {
        self._selection = selection
        self.style = configuration
    }
    
    public init(
        selection: Binding<SPSelection<DataAsset>?>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) {
        self._selection = Binding {
            selection.wrappedValue ?? .init(value: CKColor(hexString: "#0000"))
        } set: { newValue in
            selection.wrappedValue = newValue
        }
        self.style = configuration
    }
    
    public init(
        systemImage: Binding<String>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        self._selection = Binding {
            SPSelection(systemName: systemImage.wrappedValue)
        } set: { newValue in
            if let symbol = newValue.getSymbol() {
                let name: String
                switch configuration.symbolVariant {
                case .filled:
                    name = symbol.filledName
                case .outlined:
                    name = symbol.notFilled
                }
                systemImage.wrappedValue = name
            }
        }
        self.allowedPageTypes = [.symbol]
        self.allowColorSelection = false
        self.style = configuration
    }
    
    public init(
        systemImage: Binding<String>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        self._selection = Binding {
            SPSelection(systemName: systemImage.wrappedValue, color: ckColor.wrappedValue)
        } set: { newValue in
            if let symbol = newValue.getSymbol() {
                let name: String
                switch configuration.symbolVariant {
                case .filled:
                    name = symbol.filledName
                case .outlined:
                    name = symbol.notFilled
                }
                systemImage.wrappedValue = name
            }
            ckColor.wrappedValue = newValue.getColor() ?? ckColor.wrappedValue
        }
        self.allowedPageTypes = [.symbol]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        systemImage: Binding<String>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        self._selection = Binding {
            SPSelection(systemName: systemImage.wrappedValue, color: color.wrappedValue)
        } set: { newValue in
            if let symbol = newValue.getSymbol() {
                let name: String
                switch configuration.symbolVariant {
                case .filled:
                    name = symbol.filledName
                case .outlined:
                    name = symbol.notFilled
                }
                systemImage.wrappedValue = name
            }
            color.wrappedValue = newValue.getColor()?.color ?? color.wrappedValue
        }
        self.allowedPageTypes = [.symbol]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        systemImage: Binding<String>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        self._selection = Binding {
            SPSelection(systemName: systemImage.wrappedValue, colorValues: colorValues.wrappedValue)
        } set: { newValue in
            if let symbol = newValue.getSymbol() {
                let name: String
                switch configuration.symbolVariant {
                case .filled:
                    name = symbol.filledName
                case .outlined:
                    name = symbol.notFilled
                }
                systemImage.wrappedValue = name
            }
            let components = newValue.getColor()?.rgbComponents() ?? .init(r: 0, g: 0, b: 0, a: 1)
            
            colorValues.wrappedValue = [components.r, components.g, components.b, components.a]
        }
        self.allowedPageTypes = [.symbol]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        emoji: Binding<SPEmoji>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        self._selection = Binding {
            SPSelection(emoji: emoji.wrappedValue)
        } set: { newValue in
            emoji.wrappedValue = newValue.getEmoji() ?? emoji.wrappedValue
        }
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = false
        self.style = configuration
    }
    
    public init(
        emoji: Binding<SPEmoji>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        self._selection = Binding {
            SPSelection(emoji: emoji.wrappedValue, color: ckColor.wrappedValue)
        } set: { newValue in
            emoji.wrappedValue = newValue.getEmoji() ?? emoji.wrappedValue
            ckColor.wrappedValue = newValue.getColor() ?? ckColor.wrappedValue
        }
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        emoji: Binding<SPEmoji>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        self._selection = Binding {
            SPSelection(emoji: emoji.wrappedValue, color: color.wrappedValue)
        } set: { newValue in
            emoji.wrappedValue = newValue.getEmoji() ?? emoji.wrappedValue
            color.wrappedValue = newValue.getColor()?.color ?? color.wrappedValue
        }
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        emoji: Binding<SPEmoji>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        self._selection = Binding {
            SPSelection(emoji: emoji.wrappedValue, colorValues: colorValues.wrappedValue)
        } set: { newValue in
            emoji.wrappedValue = newValue.getEmoji() ?? emoji.wrappedValue
            let components = newValue.getColor()?.rgbComponents() ?? .init(r: 0, g: 0, b: 0, a: 1)
            
            colorValues.wrappedValue = [components.r, components.g, components.b, components.a]
        }
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    #if os(iOS) || os(macOS) || os(visionOS)
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    public init(
        image: Binding<SPImage>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        self._selection = Binding {
            SPSelection(image: image.wrappedValue)
        } set: { newValue in
            image.wrappedValue = newValue.getImage() ?? image.wrappedValue
        }
        self.allowedPageTypes = [.image]
        self.allowColorSelection = false
        self.style = configuration
    }
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    public init(
        image: Binding<SPImage>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        self._selection = Binding {
            SPSelection(image: image.wrappedValue, color: ckColor.wrappedValue)
        } set: { newValue in
            image.wrappedValue = newValue.getImage() ?? image.wrappedValue
            ckColor.wrappedValue = newValue.getColor() ?? ckColor.wrappedValue
        }
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    public init(
        image: Binding<SPImage>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        self._selection = Binding {
            SPSelection(image: image.wrappedValue, color: color.wrappedValue)
        } set: { newValue in
            image.wrappedValue = newValue.getImage() ?? image.wrappedValue
            color.wrappedValue = newValue.getColor()?.color ?? color.wrappedValue
        }
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    public init(
        image: Binding<SPImage>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        self._selection = Binding {
            SPSelection(image: image.wrappedValue, colorValues: colorValues.wrappedValue)
        } set: { newValue in
            image.wrappedValue = newValue.getImage() ?? image.wrappedValue
            let components = newValue.getColor()?.rgbComponents() ?? .init(r: 0, g: 0, b: 0, a: 1)
            
            colorValues.wrappedValue = [components.r, components.g, components.b, components.a]
        }
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = true
        self.style = configuration
    }
    #endif
}
