//
//  SymbolPickerOld.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 5/12/24.
//

import SwiftUI

@available(macOS 11.0, iOS 14.0, *)
@available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ SymbolPicker(for: SymbolPickerData)")
@available(iOS, deprecated: 15.0, message: "Use the newer initializer available in macOS 12.0+ SymbolPicker(for: SymbolPickerData)")
public struct SymbolPickerOld: View {
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
        UIDevice.current.userInterfaceIdiom == .pad
    }
    #endif
    
    #if os(macOS)
    @ViewBuilder public var contentMacOS: some View{
        VStack{
            if pickerData.colorValue?.wrappedValue != .clear{
                colorPicker
            }
            SearchBar(text: $searchText, prompt: "Search Symbols")
                .padding(.horizontal, 12)
                .padding(.bottom, 10)
            symbolsList
            Spacer()
        }
        .frame(width: 310, height: 430)
    }
    #endif
    
    #if os(iOS) || os(visionOS)
    @ViewBuilder public var contentIOS: some View{
        NavigationView{
            List{
                Section {
                    selectedSymbolView
                }

                Section {
                    if pickerData.colorValue?.wrappedValue != .clear{ colorPicker }
                }
                Section {
                    symbolsList
                }
            }
            .navigationTitle("Icon")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("OK"){
                        pickerData.isPresented.wrappedValue = false
                    }
                    .opacity(usePopover ? 0 : 1)
                    .allowsHitTesting(!usePopover)
                }
            }
            .padding(.top, -30)
        }
        .frame(width: usePopover ? 400 : nil, height: usePopover ? 430 : nil)
    }
    #endif
    
    @ViewBuilder public var selectedSymbolView: some View{
        HStack{
            Spacer()
            Image(systemName: pickerData.symbolName.wrappedValue)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .spForegroundStyle(pickerData.colorValue?.wrappedValue ?? .clear == .clear ? .primary : .white)
                .padding(10)
                .background(pickerData.colorValue?.wrappedValue ?? .clear)
                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
            Spacer()
        }
        .padding(.vertical, 5)
    }
    
    @ViewBuilder public var colorPicker: some View{
        #if os(iOS) || os(visionOS)
        let size: CGFloat = 40
        #else
        let size: CGFloat = 21
        #endif
        LazyVGrid(columns: [GridItem(.adaptive(minimum: size, maximum: size))]){
            ForEach(SymbolColor.allCases){
                colorOption(for: $0)
            }
        }
        #if os(macOS)
        .padding(.top, 12)
        .padding(.horizontal, 7)
        #else
        .padding(.vertical, 3)
        #endif
        #if os(macOS)
        Divider()
        #endif
    }
    
    @ViewBuilder public var symbolsList: some View {
        #if os(iOS)
        let sizeWidth: CGFloat = 35
        let sizeHeight: CGFloat = 40
        #elseif os(visionOS)
        let sizeWidth: CGFloat = 28
        let sizeHeight: CGFloat = 28
        #else
        let sizeWidth: CGFloat = 28
        let sizeHeight: CGFloat = 28
        #endif
        ScrollView(.vertical) {
            #if os(iOS)
            SearchBar(text: $searchText, prompt: "Search Symbols")
                .padding(.bottom, -8)
                .padding(.top, 3)
                .padding(.horizontal, -8)
            #endif
            ForEach(loadedSymbols) { section in
                Section {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: sizeWidth, maximum: sizeHeight))]) {
                        ForEach(section.symbols) { symbol in
                            symbolButton(for: symbol)
                        }
                    }
                    #if os(macOS)
                    .offset(y: -3)
                    #else
                    .padding(.horizontal, 4)
                    #endif
                } header: {
                    HStack {
                        Text(section.title)
                            .font(.callout)
                            .fontWeight(.semibold)
                        #if os(iOS) || os(visionOS)
                            .spForegroundStyle(Color.primary)
                        #else
                            .spForegroundStyle(Color.primary.opacity(0.4))
                            .padding(.horizontal, 5)
                        #endif
                        Spacer()
                    }
                }
            }
            #if os(macOS)
            .padding(.horizontal, 12)
            #else
            .padding(.horizontal, 3)
            .padding(.top, 5)
            #endif
        }
        
        #if os(macOS)
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipped()
        .offset(y: -17)
        .padding(.top, 5)
        #endif
    }
    
    @ViewBuilder
    public func colorOption(for color: SymbolColor) -> some View{
        #if os(macOS)
        let symbolName = pickerData.colorValue?.wrappedValue == color.color ? "checkmark.circle.fill" : "circle.fill"
        let outlineColor = Color.black
        #else
        #if os(visionOS)
        let outlineColor = Color.primary
        #else
        let outlineColor = colorScheme == .dark ? Color.white : Color.black
        #endif
        let symbolName = "circle.fill"
        #endif
        Button{
            pickerData.colorValue?.wrappedValue = color.color
        }label:{
            Image(systemName: symbolName)
                .resizable()
                .scaledToFit()
                #if os(iOS) || os(visionOS)
                .overlay(
                    Circle()
                        .stroke(.black.opacity(0.05), lineWidth: 2)
                )
                #else
                .overlay(
                    Circle()
                        .stroke(.black.opacity(0.05), lineWidth: 3)
                )
                #endif
                .clipShape(.circle)
                #if os(macOS)
                .padding(2)
                #else
                .padding(4.5)
                .overlay(
                    Circle()
                        .stroke(outlineColor.opacity(pickerData.colorValue?.wrappedValue == color.color ? 0.2 : 0), lineWidth: 2.7)
                )
                #endif
            
        }
        .accessibilityElement()
        .accessibilityLabel(color.name)
        .accessibilityAddTraits(.isButton)
        .spForegroundStyle(color.color)
        .buttonStyle(.plain)
    }
    
    @ViewBuilder func symbolButton(for symbolModel: SymbolModel) -> some View {
        let primaryColor = colorScheme == .dark ? Color.white : Color.black
        let invertedColor = colorScheme == .dark ? Color.white : Color.black
        #if os(iOS)
        let sizeWidth: CGFloat = 28
        let sizeHeight: CGFloat = 32
        let cornerRadius: CGFloat = 9
        let padding: CGFloat = 5
        let backgroundPadding: CGFloat = 4
        let foregroundColor = primaryColor.opacity(0.4)
        let backgroundColor = primaryColor.opacity(pickerData.symbolName.wrappedValue == (pickerData.useFilledSymbols ? symbolModel.filledSymbolName : symbolModel.notFilledSymbolName) ? 0.1 : 0)
        #elseif os(visonOS)
        let sizeWidth: CGFloat = 22
        let sizeHeight: CGFloat = 22
        let cornerRadius: CGFloat = 15
        let padding: CGFloat = 7
        let backgroundPadding: CGFloat = 1
        let foregroundColor = primaryColor.opacity(0.4)
        let backgroundColor = primaryColor.opacity(pickerData.symbolName.wrappedValue == (pickerData.useFilledSymbols ? symbolModel.filledSymbolName : symbolModel.notFilledSymbolName) ? 0.1 : 0)
        #else
        let sizeWidth: CGFloat = 22
        let sizeHeight: CGFloat = 22
        let cornerRadius: CGFloat = 7
        let padding: CGFloat = 5
        let backgroundPadding: CGFloat = 4
        let foregroundColor = pickerData.symbolName.wrappedValue == (pickerData.useFilledSymbols ? symbolModel.filledSymbolName : symbolModel.notFilledSymbolName) ? invertedColor :       primaryColor.opacity(0.8)
        let backgroundColor = primaryColor.opacity(pickerData.symbolName.wrappedValue == (pickerData.useFilledSymbols ? symbolModel.filledSymbolName : symbolModel.notFilledSymbolName) ? 0.25 : 0)
        #endif
        Button{
            pickerData.symbolName.wrappedValue = pickerData.useFilledSymbols ? symbolModel.filledSymbolName : symbolModel.notFilledSymbolName
            if pickerData.dismissOnSymbolChange{
                pickerData.isPresented.wrappedValue  = false
            }
        }label:{
            Image(systemName: pickerData.useFilledSymbols ? symbolModel.filledSymbolName : symbolModel.notFilledSymbolName)
                .resizable()
                .scaledToFit()
                .frame(width: sizeWidth * 0.95, height: sizeHeight * 0.7)
                .frame(width: sizeWidth, height: sizeHeight)
                .if{ content in
                    if #available(macOS 13.0, iOS 16.0, visionOS 1.0, *) {
                        content.fontWeight(.medium)
                    }
                }
                .padding(.vertical, padding)
                .padding(.horizontal, padding)
                .background(backgroundColor)
                .spForegroundStyle(foregroundColor)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                .padding(.vertical, 4)
                .background(Color.gray.opacity(0.001))
        }
        .accessibilityElement()
        .accessibilityLabel(symbolModel.description)
        .accessibilityAddTraits([.isButton, .isImage])
        .buttonStyle(.plain)
        .padding(.horizontal, backgroundPadding)
    }
    
    public init(for data: SymbolPickerData) {
        self.pickerData = data
    }
}

#Preview {
    SymbolPickerOld(for: .init(isPresented: .constant(true), symbolName: .constant("car"), color: .constant(SymbolColor.red)))
}
