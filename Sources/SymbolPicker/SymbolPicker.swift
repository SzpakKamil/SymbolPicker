//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 5/12/24.
//

import SwiftUI
import SearchBar

public struct SymbolPicker: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText = ""
    @State private var loadedSymbols: [SymbolSection] = []
    var pickerData: SymbolPickerData

    public var body: some View {
        Group{
            #if os(macOS)
            contentMacOS
            #else
            contentIOS
            #endif
        }
        .onAppear{ pickerData.loadAllSymbols(for: $loadedSymbols) }
        .onChange(of: searchText){_ in  pickerData.handleSearchText(for: searchText, loadedSymbols: $loadedSymbols) }
    }
    
    #if !os(macOS)
    var usePopover: Bool{
        if #available(iOS 17.0, *) {
            UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .vision
        } else {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    #endif
    
    #if os(macOS)
    @ViewBuilder public var contentMacOS: some View{
        GeometryReader{ geo in
            VStack{
                if pickerData.colorValue?.wrappedValue != .customColor([0,0,0,0]){ SPColorPicker(pickerData: pickerData, geo: geo) }
                SearchBar(text: $searchText, prompt: "Search Symbols")
                    .padding(.horizontal, 12)
                    .padding(.bottom, 10)
                SPSymbolsList(searchText: $searchText, pickerData: pickerData, loadedSymbols: loadedSymbols, geo: geo)
                Spacer()
            }
        }
        .frame(width: 310, height: 430)
    }
    #endif
    
    #if os(iOS) || os(visionOS)
    @ViewBuilder public var contentIOS: some View{
        if #available(iOS 16.0, macOS 13.0, visionOS 1.0, *) {
            NavigationStack{
                GeometryReader{ geo in
                    List{
                        SPSelectedSymbol(pickerData: pickerData, geo: geo)
                        if pickerData.colorValue?.wrappedValue != .customColor([0,0,0,0]){ SPColorPicker(pickerData: pickerData, geo: geo) }
                        SPSymbolsList(searchText: $searchText, pickerData: pickerData, loadedSymbols: loadedSymbols, geo: geo)
                    }
                    .listRowSpacing(15)
                    .navigationTitle("Icon")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .topBarTrailing){
                            SPDismissButton(pickerData: pickerData)
                        }
                    }
                    .padding(.top, usePopover ? 0 : -30)
                }
            }
            .frame(width: usePopover ? 350 : nil, height: usePopover ? 500 : nil)
        } else {
            NavigationView{
                GeometryReader{ geo in
                    List{
                        SPSelectedSymbol(pickerData: pickerData, geo: geo)
                        if pickerData.colorValue?.wrappedValue != .customColor([0,0,0,0]){ SPColorPicker(pickerData: pickerData, geo: geo) }
                        SPSymbolsList(searchText: $searchText, pickerData: pickerData, loadedSymbols: loadedSymbols, geo: geo)
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
                            SPDismissButton(pickerData: pickerData)
                        }
                    }
                    .padding(.top, -30)
                }
            }
            .frame(width: usePopover ? 400 : nil, height: usePopover ? 430 : nil)
        }
    }
    #endif

    public init(for data: SymbolPickerData) {
        self.pickerData = data
    }
    
    @available(macOS 12.0, iOS 15.0, visionOS 1.0, *)
    public init(symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented:.constant(false), symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 12.0, iOS 15.0, visionOS 1.0, *)
    public init(symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented:.constant(false), symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 12.0, iOS 15.0, visionOS 1.0, *)
    public init(symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented:.constant(false), symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 12.0, iOS 15.0, visionOS 1.0, *)
    public init(symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented:.constant(false), symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 11.0, iOS 14.0, visionOS 1.0, *)
    @available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(iOS, deprecated: 15.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ init(symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 11.0, iOS 14.0, visionOS 1.0, *)
    @available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(iOS, deprecated: 15.0, message: "Use the newer initializer available in iOS 15.0+ init(symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ init(symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 11.0, iOS 14.0, visionOS 1.0, *)
    @available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(iOS, deprecated: 15.0, message: "Use the newer initializer available in iOS 15.0+ init(symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ init(symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 11.0, iOS 14.0, visionOS 1.0, *)
    @available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(iOS, deprecated: 15.0, message: "Use the newer initializer available in iOS 15.0+ init(symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ init(symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
}

