//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 5/12/24.
//

import SwiftUI
import Combine
import SearchBar

public struct SymbolPicker: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    @Binding var isPresented: Bool
    @Binding var symbolName: String
    @Binding var colorValue: SymbolColor
    @State private var searchText = ""
    @State private var loadedSymbols: [SymbolSection] = []
    @State private var searchDebounceTask: Task<Void, Never>? = nil
    private var dismissType: SymbolPickerDismissType = .manual
    private var symbolsStyle: SymbolPickerSymbolsStyle = .outlined
    
    @State private var offsetCalculated: CGFloat = 0
    @State private var scaleCalculated: CGFloat = 0
    
    private var cancellables = Set<AnyCancellable>()

    @_documentation(visibility: internal)
    public var isUsingFilledSymbols: Bool {
        symbolsStyle == .filled
    }
    
    @_documentation(visibility: internal)
    public var body: some View {
        Group{
            #if os(macOS)
            contentMacOS
            #else
            contentIOS
            #endif
        }
        .onAppear{ loadAllSymbols(for: $loadedSymbols) }
        .onChange(of: searchText) { newValue in
            searchDebounceTask?.cancel()
            if newValue.isEmpty {
                handleSearchText(for: newValue, loadedSymbols: $loadedSymbols)
            } else {
                searchDebounceTask = Task {
                    try? await Task.sleep(nanoseconds: 500_000_000)
                    if Task.isCancelled { return }
                    handleSearchText(for: newValue, loadedSymbols: $loadedSymbols)
                }
            }
        }
    }
    
    #if !os(macOS)
    @_documentation(visibility: internal)
    var usePopover: Bool{
        if #available(iOS 17.0, *) {
            UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .vision
        } else {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    #endif
    @_documentation(visibility: internal)
    var invetedPrimaryColor: Color {
        if colorScheme == .dark {
            return .white
        } else {
            return .clear
        }
    }
    
    #if os(macOS)
    @_documentation(visibility: internal)
    @ViewBuilder public var contentMacOS: some View{
        let isShowingColorPicker = colorValue != .customColor([0,0,0,0])
        var color: Color{
            if colorScheme == .dark{
                return .black.opacity(0.05)
            }else{
                return .white.opacity(0.25)
            }
        }
        GeometryReader{ geo in
            VStack{
                if isShowingColorPicker{
                    SPColorPicker(colorValue: $colorValue, geo: geo)
                }
                SearchBar(text: $searchText, prompt: "Search Symbols")
                    .searchBarStyle(.rounded)
                    .if{ content in
                        if #available(macOS 26.0, *){
                            content.searchBarMaterial(.glass)
                        }else{
                            content
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, isShowingColorPicker ? 4 : 8)
                    .padding(.bottom, 10)
                SPSymbolsList(searchText: $searchText, symbolName: $symbolName, isUsingFilledSymbols: isUsingFilledSymbols, dismissType: dismissType, loadedSymbols: loadedSymbols, geo: geo, isPresented: $isPresented)
                Spacer()
            }
        }
        .frame(width: 310, height: 430)
    }
    #endif
    
    #if os(iOS) || os(visionOS)
    @_documentation(visibility: internal)
    @ViewBuilder public var contentIOS: some View{
        if #available(iOS 16.0, macOS 13.0, visionOS 1.0, *) {
            NavigationStack{
                GeometryReader{ geo in
                    List{
                        if #unavailable(iOS 26.0, visionOS 26.0){
                            
                            SPSelectedSymbol(symbolName: symbolName, colorValue: colorValue, geo: geo, calculatedScale: scaleCalculated, calculatedOffset: offsetCalculated)
                        }
                        if colorValue != .customColor([0,0,0,0]){
                            SPColorPicker(colorValue: $colorValue, geo: geo)
                                .listRowInsets(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                        }
                        SPSymbolsList(searchText: $searchText, symbolName: $symbolName, isUsingFilledSymbols: isUsingFilledSymbols, dismissType: dismissType, loadedSymbols: loadedSymbols, geo: geo, isPresented: $isPresented)
                        #if os(iOS)
                            .listRowInsets(EdgeInsets(top: 6, leading: 11, bottom: 6, trailing: 11))
                        #else
                            .listRowInsets(EdgeInsets(top: 0, leading: 11, bottom: 6, trailing: 11))
                        #endif

                    }
                    .listRowSpacing(15)
                    .navigationBarTitleDisplayMode(.inline)
                    .if{ content in
                        if #available(iOS 26.0, visionOS 26.0, *){
                            content
                                .safeAreaInset(edge: .top, content: {
                                    SPSelectedSymbol(symbolName: symbolName, colorValue: colorValue, geo: geo, calculatedScale: scaleCalculated, calculatedOffset: offsetCalculated)
                                })
                                .onScrollGeometryChange(for: CGFloat.self, of: { geometry in
                                    geometry.bounds.minY
                                }, action: { oldValue, newValue in
                                    let start: CGFloat = -127
                                    let end: CGFloat = -66
                                    let progress = min(max((start - newValue) / (start - end), 0), 1)
                                    let newOffsetCalculated = 10 - (30 * progress)
                                    
                                    if abs(offsetCalculated - newOffsetCalculated) > 0.5 {
                                        offsetCalculated = newOffsetCalculated
                                    }

                                    let progress2 = min(max((start - newValue) / (start - end), 0), 1)
                                    let newScaleCalculated =  1.0 - 0.5 * progress2 // Scales from 1.0 to 0.4
                                    
                                    if abs(scaleCalculated - newScaleCalculated) > 0.01 {
                                        scaleCalculated = newScaleCalculated
                                    }
                                })
                                .presentationDragIndicator(.visible)
                        }else{
                            content
                                .navigationTitle("Icon")
                                .toolbar{
                                    ToolbarItem(placement: .topBarTrailing){
                                        SPDismissButton(isPresented: $isPresented)
                                    }
                                }
                                .padding(.top, usePopover ? 0 : -30)
                        }
                    }
                }
            }
            .frame(width: usePopover ? 350 : nil, height: usePopover ? 500 : nil)
        } else {
            NavigationView{
                GeometryReader{ geo in
                    List{
                        SPSelectedSymbol(symbolName: symbolName, colorValue: colorValue, geo: geo)
                        if colorValue != .customColor([0,0,0,0]){
        
                            SPColorPicker(colorValue: $colorValue, geo: geo)
                        }
                        SPSymbolsList(searchText: $searchText, symbolName: $symbolName, isUsingFilledSymbols: isUsingFilledSymbols, dismissType: dismissType, loadedSymbols: loadedSymbols, geo: geo, isPresented: $isPresented)
                    }
                    .if{ content in
                        if #available(iOS 15.0, macOS 12.0, *){
                            content.listRowSpacing(15)
                        }
                    }
                    .navigationTitle("Icon")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .topBarTrailing){
                            SPDismissButton(isPresented: $isPresented)
                        }
                    }
                    .padding(.top, -30)
                }
            }
            .frame(width: usePopover ? 400 : nil, height: usePopover ? 430 : nil)
        }
    }
    #endif
    
    @available(macOS 12.0, iOS 15.0, visionOS 1.0, *)
    public init(symbolName: Binding<String>, color: Binding<Color>?) {
        self._isPresented = .constant(false)
        self._symbolName = symbolName
        self._colorValue = Binding{
            SymbolColor.customColor(color?.wrappedValue.components ?? [0,0,0,0])
        }set: { value in
            color?.wrappedValue = value.color
        }
    }
    
    @available(macOS 12.0, iOS 15.0, visionOS 1.0, *)
    public init(symbolName: Binding<String>, color: Binding<[Double]>?) {
        self._isPresented = .constant(false)
        self._symbolName = symbolName
        self._colorValue = Binding{
            SymbolColor.customColor(color?.wrappedValue ?? [0,0,0,0])
        }set: { value in
            color?.wrappedValue = value.value
        }
    }
    
    @available(macOS 12.0, iOS 15.0, visionOS 1.0, *)
    public init(symbolName: Binding<String>, color: Binding<SymbolColor>?) {
        self._isPresented = .constant(false)
        self._symbolName = symbolName
        self._colorValue = Binding{
            color?.wrappedValue ?? SymbolColor.customColor([0,0,0,0])
        }set: { value in
            color?.wrappedValue = value
        }
    }
    
    @available(macOS 12.0, iOS 15.0, visionOS 1.0, *)
    public init(symbolName: Binding<String>) {
        self._isPresented = .constant(false)
        self._symbolName = symbolName
        self._colorValue = .constant(SymbolColor.customColor([0,0,0,0]))
    }
    
    @available(macOS 11.0, iOS 14.0, visionOS 1.0, *)
    @available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(iOS, deprecated: 15.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ init(symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>?) {
        self._isPresented = isPresented
        self._symbolName = symbolName
        self._colorValue = Binding{
            SymbolColor.customColor(color?.wrappedValue.components ?? [0,0,0,0])
        }set: { value in
            color?.wrappedValue = value.color
        }
    }
    
    @available(macOS 11.0, iOS 14.0, visionOS 1.0, *)
    @available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(iOS, deprecated: 15.0, message: "Use the newer initializer available in iOS 15.0+ init(symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ init(symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<[Double]>?) {
        self._isPresented = isPresented
        self._symbolName = symbolName
        self._colorValue = Binding{
            SymbolColor.customColor(color?.wrappedValue ?? [0,0,0,0])
        }set: { value in
            color?.wrappedValue = value.value
        }
    }
    
    @available(macOS 11.0, iOS 14.0, visionOS 1.0, *)
    @available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(iOS, deprecated: 15.0, message: "Use the newer initializer available in iOS 15.0+ init(symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ init(symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<SymbolColor>?) {
        self._isPresented = isPresented
        self._symbolName = symbolName
        self._colorValue = Binding{
            color?.wrappedValue ?? SymbolColor.customColor([0,0,0,0])
        }set: { value in
            color?.wrappedValue = value
        }
    }
    
    @available(macOS 11.0, iOS 14.0, visionOS 1.0, *)
    @available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(iOS, deprecated: 15.0, message: "Use the newer initializer available in iOS 15.0+ init(symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ init(symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>) {
        self._isPresented = isPresented
        self._symbolName = symbolName
        self._colorValue = .constant(SymbolColor.customColor([0,0,0,0]))
    }
    
    func handleSearchText(for searchText: String, loadedSymbols: Binding<[SymbolSection]>) {
        // If search text is empty, load all symbols asynchronously
        if searchText.isEmpty {
            loadAllSymbols(for: loadedSymbols)
            return
        }

        // Perform search asynchronously
        Task.detached(priority: .userInitiated) {
            let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            let filteredSymbols = SymbolLists.allSymbols.filter { $0.lowercasedDescription.localizedStandardContains(trimmedSearchText) }
            // Sort results in the background
            let sortedSymbols = filteredSymbols.sorted()

            // Update UI on the main thread
            await MainActor.run {
                loadedSymbols.wrappedValue = [.init(title: "", symbols: sortedSymbols)]
            }
        }
    }

    func loadAllSymbols(for loadedSymbols: Binding<[SymbolSection]>) {
        loadedSymbols.wrappedValue = [SymbolLists.symbolSections[0], SymbolLists.symbolSections[1]]
        Task.detached(priority: .userInitiated) {
            await MainActor.run {
                loadedSymbols.wrappedValue = SymbolLists.symbolSections
            }
        }
    }
}

public extension SymbolPicker{
    func symbolPickerSymbolsStyle(_ style: SymbolPickerSymbolsStyle) -> Self {
        var copy = self
        copy.symbolsStyle = style
        return copy
    }
    func symbolPickerDismissType(_ type: SymbolPickerDismissType) -> Self {
        var copy = self
        copy.dismissType = type
        return copy
    }
}

