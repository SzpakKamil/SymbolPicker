//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import Foundation
import ColorKit

public struct SymbolPicker<DataAsset: SPDataAsset, Configuration: SymbolPickerConfiguration>: View {
    @Binding private var selection: SPSelection<DataAsset>
    @State var pageType = SPPageType.emoji
    @State var searchText: String = ""
    @State private var hasAppeared = false
    var style: Configuration
    var allowedPageTypes: [SPPageType] = SPPageType.allCases
    var allowColorSelection: Bool = true
    private var selectionRecreator: ((SPSymbol.Variant) -> Binding<SPSelection<DataAsset>>)? = nil
    
    mutating func setStyle(_ style: Configuration) {
        self.style = style
        if let recreator = selectionRecreator {
            self._selection = recreator(style.symbolVariant)
            if selection.type == .symbol, let symbol = selection.getSymbol() {
                selection = SPSelection(symbol: symbol, color: selection.getColor())
            }
        }
    }
    
    var isDisplayedAsPopover: Bool{
        #if os(iOS)
        UIDevice.current.userInterfaceIdiom == .pad && [SPPresentationConfiguration.DisplayType.popover, .default].contains(style.presentation.presentationType)
        #else
        [SPPresentationConfiguration.DisplayType.popover, .default].contains(style.presentation.presentationType)
        #endif
    }
    @_documentation(visibility: internal)
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
                    
                    ToolbarItem(placement: .bottomBar) {
                        style.getForEachViews(for: .toolbarBottomLeading)
                    }
                    
                    ToolbarItem(placement: .bottomBar) {
                        style.getForEachViews(for: .toolbarBottom)
                    }
                    ToolbarItem(placement: .bottomBar) {
                        style.getForEachViews(for: .toolbarBottomTralling)
                    }
                    #else
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
        if #available(iOS 26.0, *), style.displayStyle == .compact, style.getViews(for: .safeAreaBottom).isEmpty, !isDisplayedAsPopover, style.allowSearching{
            NavigationStack{
                view()
                    .searchable(
                        text: $searchText,
                        placement: .toolbarPrincipal, prompt: pageType == .symbol ? Text(SPTranslation.SearchSymbols.localizedDescription ): pageType == .emoji ? Text(SPTranslation.SearchEmojis.localizedDescription) : nil
                    )
                    .ignoresSafeArea(edges: .top)
            }
        }else if #available(iOS 17.0, *){
            NavigationStack{
                view()
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(.top, -5)
                    .background(style.presentation.presentationBackgroundColor.ignoresSafeArea())
            }
        }else if #available(iOS 16.0, *){
            NavigationStack{
                view()
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(.top, -15)
                    .background(style.presentation.presentationBackgroundColor.ignoresSafeArea())
            }
        }else{
            NavigationView{
                view()
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(.top, -15)
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
        let selectionBinding = selection
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                selectionBinding.wrappedValue ?? .init(value: CKColor(hexString: "#0000"))
            } set: { newValue in
                selectionBinding.wrappedValue = newValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.style = configuration
    }
    
    public init(
        systemImage: Binding<String>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let systemImageBinding = systemImage
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { variant in
            Binding {
                SPSelection(systemName: systemImageBinding.wrappedValue)
            } set: { newValue in
                if let symbol = newValue.getSymbol() {
                    systemImageBinding.wrappedValue = symbol.name(for: variant)
                }
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.symbol]
        self.allowColorSelection = false
        self.style = configuration
    }
    
    public init(
        systemImage: Binding<String?>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let systemImageBinding = systemImage
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { variant in
            Binding {
                SPSelection(systemName: systemImageBinding.wrappedValue ?? "")
            } set: { newValue in
                if let symbol = newValue.getSymbol() {
                    systemImageBinding.wrappedValue = symbol.name(for: variant)
                }
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.symbol]
        self.allowColorSelection = false
        self.style = configuration
    }
    
    public init(
        systemImage: Binding<String>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let systemImageBinding = systemImage
        let ckColorBinding = ckColor
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { variant in
            Binding {
                SPSelection(systemName: systemImageBinding.wrappedValue, ckColor: ckColorBinding.wrappedValue)
            } set: { newValue in
                if let symbol = newValue.getSymbol() {
                    systemImageBinding.wrappedValue = symbol.name(for: variant)
                }
                ckColorBinding.wrappedValue = newValue.getColor() ?? ckColorBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.symbol]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        systemImage: Binding<String?>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let systemImageBinding = systemImage
        let ckColorBinding = ckColor
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { variant in
            Binding {
                SPSelection(systemName: systemImageBinding.wrappedValue ?? "", ckColor: ckColorBinding.wrappedValue)
            } set: { newValue in
                if let symbol = newValue.getSymbol() {
                    systemImageBinding.wrappedValue = symbol.name(for: variant)
                }
                ckColorBinding.wrappedValue = newValue.getColor() ?? ckColorBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.symbol]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        systemImage: Binding<String>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let systemImageBinding = systemImage
        let colorBinding = color
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { variant in
            Binding {
                SPSelection(systemName: systemImageBinding.wrappedValue, color: colorBinding.wrappedValue)
            } set: { newValue in
                if let symbol = newValue.getSymbol() {
                    systemImageBinding.wrappedValue = symbol.name(for: variant)
                }
                colorBinding.wrappedValue = newValue.getColor()?.color ?? colorBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.symbol]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        systemImage: Binding<String?>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let systemImageBinding = systemImage
        let colorBinding = color
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { variant in
            Binding {
                SPSelection(systemName: systemImageBinding.wrappedValue ?? "", color: colorBinding.wrappedValue)
            } set: { newValue in
                if let symbol = newValue.getSymbol() {
                    systemImageBinding.wrappedValue = symbol.name(for: variant)
                }
                colorBinding.wrappedValue = newValue.getColor()?.color ?? colorBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.symbol]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        systemImage: Binding<String>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let systemImageBinding = systemImage
        let colorValuesBinding = colorValues
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { variant in
            Binding {
                SPSelection(systemName: systemImageBinding.wrappedValue, colorValues: colorValuesBinding.wrappedValue)
            } set: { newValue in
                if let symbol = newValue.getSymbol() {
                    systemImageBinding.wrappedValue = symbol.name(for: variant)
                }
                let components = newValue.getColor()?.rgbComponents() ?? .init(r: 0, g: 0, b: 0, a: 1)
                colorValuesBinding.wrappedValue = [components.r, components.g, components.b, components.a]
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.symbol]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        systemImage: Binding<String?>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let systemImageBinding = systemImage
        let colorValuesBinding = colorValues
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { variant in
            Binding {
                SPSelection(systemName: systemImageBinding.wrappedValue ?? "", colorValues: colorValuesBinding.wrappedValue)
            } set: { newValue in
                if let symbol = newValue.getSymbol() {
                    systemImageBinding.wrappedValue = symbol.name(for: variant)
                }
                let components = newValue.getColor()?.rgbComponents() ?? .init(r: 0, g: 0, b: 0, a: 1)
                colorValuesBinding.wrappedValue = [components.r, components.g, components.b, components.a]
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.symbol]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        emoji: Binding<SPEmoji>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let emojiBinding = emoji
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(emoji: emojiBinding.wrappedValue)
            } set: { newValue in
                emojiBinding.wrappedValue = newValue.getEmoji() ?? emojiBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = false
        self.style = configuration
    }
    
    public init(
        emoji: Binding<SPEmoji?>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let emojiBinding = emoji
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(emoji: emojiBinding.wrappedValue ?? SPEmoji(""))
            } set: { newValue in
                emojiBinding.wrappedValue = newValue.getEmoji()
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = false
        self.style = configuration
    }
    
    public init(
        emoji: Binding<SPEmoji>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let emojiBinding = emoji
        let ckColorBinding = ckColor
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(emoji: emojiBinding.wrappedValue, ckColor: ckColorBinding.wrappedValue)
            } set: { newValue in
                emojiBinding.wrappedValue = newValue.getEmoji() ?? emojiBinding.wrappedValue
                ckColorBinding.wrappedValue = newValue.getColor() ?? ckColorBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        emoji: Binding<SPEmoji?>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let emojiBinding = emoji
        let ckColorBinding = ckColor
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(emoji: emojiBinding.wrappedValue ?? SPEmoji(""), ckColor: ckColorBinding.wrappedValue)
            } set: { newValue in
                emojiBinding.wrappedValue = newValue.getEmoji()
                ckColorBinding.wrappedValue = newValue.getColor() ?? ckColorBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        emoji: Binding<SPEmoji>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let emojiBinding = emoji
        let colorBinding = color
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(emoji: emojiBinding.wrappedValue, color: colorBinding.wrappedValue)
            } set: { newValue in
                emojiBinding.wrappedValue = newValue.getEmoji() ?? emojiBinding.wrappedValue
                colorBinding.wrappedValue = newValue.getColor()?.color ?? colorBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        emoji: Binding<SPEmoji?>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let emojiBinding = emoji
        let colorBinding = color
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(emoji: emojiBinding.wrappedValue ?? SPEmoji(""), color: colorBinding.wrappedValue)
            } set: { newValue in
                emojiBinding.wrappedValue = newValue.getEmoji()
                colorBinding.wrappedValue = newValue.getColor()?.color ?? colorBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        emoji: Binding<SPEmoji>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let emojiBinding = emoji
        let colorValuesBinding = colorValues
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(emoji: emojiBinding.wrappedValue, colorValues: colorValuesBinding.wrappedValue)
            } set: { newValue in
                emojiBinding.wrappedValue = newValue.getEmoji() ?? emojiBinding.wrappedValue
                let components = newValue.getColor()?.rgbComponents() ?? .init(r: 0, g: 0, b: 0, a: 1)
                colorValuesBinding.wrappedValue = [components.r, components.g, components.b, components.a]
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.emoji]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    public init(
        emoji: Binding<SPEmoji?>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let emojiBinding = emoji
        let colorValuesBinding = colorValues
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(emoji: emojiBinding.wrappedValue ?? SPEmoji(""), colorValues: colorValuesBinding.wrappedValue)
            } set: { newValue in
                emojiBinding.wrappedValue = newValue.getEmoji()
                let components = newValue.getColor()?.rgbComponents() ?? .init(r: 0, g: 0, b: 0, a: 1)
                colorValuesBinding.wrappedValue = [components.r, components.g, components.b, components.a]
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
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
        let imageBinding = image
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(image: imageBinding.wrappedValue)
            } set: { newValue in
                imageBinding.wrappedValue = newValue.getImage() ?? imageBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.image]
        self.allowColorSelection = false
        self.style = configuration
    }
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    public init(
        image: Binding<SPImage?>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let imageBinding = image
        let placeholderImage = SPImage(fileName: "SymbolPicker.Placeholder", rawData: Data())
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(image: imageBinding.wrappedValue ?? placeholderImage)
            } set: { newValue in
                imageBinding.wrappedValue = newValue.getImage()
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
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
        let imageBinding = image
        let ckColorBinding = ckColor
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(image: imageBinding.wrappedValue, ckColor: ckColorBinding.wrappedValue)
            } set: { newValue in
                imageBinding.wrappedValue = newValue.getImage() ?? imageBinding.wrappedValue
                ckColorBinding.wrappedValue = newValue.getColor() ?? ckColorBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.image]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    public init(
        image: Binding<SPImage?>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let imageBinding = image
        let ckColorBinding = ckColor
        let placeholderImage = SPImage(fileName: "SymbolPicker.Placeholder", rawData: Data())
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(image: imageBinding.wrappedValue ?? placeholderImage, ckColor: ckColorBinding.wrappedValue)
            } set: { newValue in
                imageBinding.wrappedValue = newValue.getImage()
                ckColorBinding.wrappedValue = newValue.getColor() ?? ckColorBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.image]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    public init(
        image: Binding<SPImage>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let imageBinding = image
        let colorBinding = color
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(image: imageBinding.wrappedValue, color: colorBinding.wrappedValue)
            } set: { newValue in
                imageBinding.wrappedValue = newValue.getImage() ?? imageBinding.wrappedValue
                colorBinding.wrappedValue = newValue.getColor()?.color ?? colorBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.image]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    public init(
        image: Binding<SPImage?>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let imageBinding = image
        let colorBinding = color
        let placeholderImage = SPImage(fileName: "SymbolPicker.Placeholder", rawData: Data())
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(image: imageBinding.wrappedValue ?? placeholderImage, color: colorBinding.wrappedValue)
            } set: { newValue in
                imageBinding.wrappedValue = newValue.getImage()
                colorBinding.wrappedValue = newValue.getColor()?.color ?? colorBinding.wrappedValue
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.image]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    public init(
        image: Binding<SPImage>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let imageBinding = image
        let colorValuesBinding = colorValues
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(image: imageBinding.wrappedValue, colorValues: colorValuesBinding.wrappedValue)
            } set: { newValue in
                imageBinding.wrappedValue = newValue.getImage() ?? imageBinding.wrappedValue
                let components = newValue.getColor()?.rgbComponents() ?? .init(r: 0, g: 0, b: 0, a: 1)
                colorValuesBinding.wrappedValue = [components.r, components.g, components.b, components.a]
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.image]
        self.allowColorSelection = true
        self.style = configuration
    }
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    public init(
        image: Binding<SPImage?>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) where DataAsset == SPSymbol {
        let imageBinding = image
        let colorValuesBinding = colorValues
        let placeholderImage = SPImage(fileName: "SymbolPicker.Placeholder", rawData: Data())
        let recreator: (SPSymbol.Variant) -> Binding<SPSelection<DataAsset>> = { _ in
            Binding {
                SPSelection(image: imageBinding.wrappedValue ?? placeholderImage, colorValues: colorValuesBinding.wrappedValue)
            } set: { newValue in
                imageBinding.wrappedValue = newValue.getImage()
                let components = newValue.getColor()?.rgbComponents() ?? .init(r: 0, g: 0, b: 0, a: 1)
                colorValuesBinding.wrappedValue = [components.r, components.g, components.b, components.a]
            }
        }
        self.selectionRecreator = recreator
        self._selection = recreator(configuration.symbolVariant)
        self.allowedPageTypes = [.image]
        self.allowColorSelection = true
        self.style = configuration
    }
    #endif
}
