//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 5/12/24.
//

import SwiftUI

@available(macOS 12.0, iOS 15.0, *)
public struct SymbolPickerNew: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    var pickerData: SymbolPickerData
    @State private var searchText = ""

    public var body: some View {
        #if os(macOS)
        contentMacOS
        #else
        contentIOS
        #endif
    }

    #if os(macOS)
    @ViewBuilder public var contentMacOS: some View{
        VStack{
            if pickerData.colorValue?.wrappedValue != .clear{
                colorPicker
            }
            if #available(macOS 13.0, iOS 16.0, *) {
                searchField
                    .padding(.top, pickerData.colorValue?.wrappedValue != .clear ? 0 : 10)
            }
            symbolsList
            Spacer()
        }
        .frame(width: 310, height: 430)
    }
    #endif
    
    #if os(iOS)
    @ViewBuilder public var contentIOS: some View{
        if #available(iOS 16.0, *) {
            NavigationStack{
                List{
                    selectedSymbolView
                    if pickerData.colorValue?.wrappedValue != .clear{ colorPicker }
                    symbolsList
                }
                .listRowSpacing(15)
                .navigationTitle("Icon")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button{
                            dismiss()
                        }label:{
                            Image(systemName: "xmark.circle.fill")
                                .fontWeight(.semibold)
                                .font(.title3)
                                .foregroundStyle(.secondary)
                                .tint(.primary)
                                .symbolRenderingMode(.hierarchical)
                        }
                        .opacity(UIDevice.current.userInterfaceIdiom == .pad ? 0 : 1)
                        .allowsHitTesting(UIDevice.current.userInterfaceIdiom != .pad)
                    }
                }
                .padding(.top, UIDevice.current.userInterfaceIdiom == .pad ? 0 : -30)
            }
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 350 : nil, height: UIDevice.current.userInterfaceIdiom == .pad ? 500 : nil)
        } else {
            NavigationView{
                List{
                    selectedSymbolView
                    if pickerData.colorValue?.wrappedValue != .clear{ colorPicker }
                    symbolsList
                }
                .listRowSpacing(15)
                .navigationTitle("Icon")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button{
                            dismiss()
                        }label:{
                            Image(systemName: "xmark.circle.fill")
                                .font(.title3)
                                .foregroundStyle(.secondary)
                                .tint(.primary)
                                .symbolRenderingMode(.hierarchical)
                        }
                        .opacity(UIDevice.current.userInterfaceIdiom == .pad ? 0 : 1)
                        .allowsHitTesting(UIDevice.current.userInterfaceIdiom != .pad)
                    }
                }
                .padding(.top, -30)
            }
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 400 : nil, height: UIDevice.current.userInterfaceIdiom == .pad ? 430 : nil)
        }
    }
    #endif
    
    
    @available(macOS 13.0, iOS 16.0, *)
    @ViewBuilder public var searchField: some View{
        List{}
            .offset(y: -10)
            .listStyle(.sidebar)
            .scrollContentBackground(.hidden)
            .searchable(text: $searchText, placement: .sidebar, prompt: "Search Symbols")
            .scrollDisabled(true)
            .frame(height: 41)
    }
    
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
        #if os(iOS)
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
        #else
        let sizeWidth: CGFloat = 28
        let sizeHeight: CGFloat = 28
        #endif
        let symbolDictionary = pickerData.useFilledSymbols ? pickerData.symbolDictionaryFilled : pickerData.symbolDictionaryNotFilled
        ScrollView(.vertical) {
            if searchText.isEmpty {
                let keys = symbolDictionary.keys.sorted { Int($0.components(separatedBy: "_")[0]) ?? 0 < Int($1.components(separatedBy: "_")[0]) ?? 0 }
                ForEach(keys, id: \.self) { key in
                    Section {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: sizeWidth, maximum: sizeHeight))]) {
                            ForEach(symbolDictionary[key]?.keys.sorted() ?? [], id: \.self) { symbolName in
                                if let symbolDescription = symbolDictionary[key]?[symbolName] {
                                    symbolButton(for: symbolName, description: symbolDescription)
                                }
                            }
                        }
                        #if os(macOS)
                        .offset(y: -3)
                        #else
                        .padding(.horizontal, 4)
                        #endif
                    } header: {
                        HStack {
                            Text(key.components(separatedBy: "_").last ?? "")
                                .font(.callout)
                                .fontWeight(.semibold)
                            #if os(iOS)
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
            } else {
                let sortedKeys = pickerData.getFilteredSymbolKeys(from: symbolDictionary, matching: searchText)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: sizeWidth, maximum: sizeHeight))]) {
                    ForEach(sortedKeys, id: \.self) { symbolName in
                        let description = pickerData.getSymbolDescription(for: symbolName, in: symbolDictionary)
                        symbolButton(for: symbolName, description: description)
                    }
                }
                .drawingGroup()
                .offset(y: -3)
                #if os(macOS)
                .padding(.horizontal, 12)
                #else
                .padding(.horizontal, 3)
                .padding(.top, 5)
                #endif
            }
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
        #else
        let symbolName = "circle.fill"
        #endif
        Button{
            pickerData.colorValue?.wrappedValue = color.color
        }label:{
            Image(systemName: symbolName)
                .resizable()
                .scaledToFit()
                #if os(iOS)
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
                        .stroke(.black.opacity(pickerData.colorValue?.wrappedValue == color.color ? 0.2 : 0), lineWidth: 2.7)
                )
                #endif
            
        }
        .accessibilityElement()
        .accessibilityLabel(color.name)
        .accessibilityAddTraits(.isButton)
        .spForegroundStyle(color.color)
        .buttonStyle(.plain)
    }
    
    @ViewBuilder func symbolButton(for systemImage: String, description: String) -> some View {
        let primaryColor = colorScheme == .dark ? Color.white : Color.black
        let invertedColor = colorScheme == .dark ? Color.white : Color.black
        Button{
            pickerData.symbolName.wrappedValue = systemImage
            if pickerData.dismissOnSymbolChange{
                dismiss()
            }
        }label:{
            #if os(iOS)
            let sizeWidth: CGFloat = 28
            let sizeHeight: CGFloat = 32
            let cornerRadius: CGFloat = 9
            let padding: CGFloat = 5
            let backgroundPadding: CGFloat = 4
            let foregroundColor = primaryColor.opacity(0.4)
            let backgroundColor = primaryColor.opacity(pickerData.symbolName.wrappedValue == systemImage ? 0.1 : 0)
            #else
            let sizeWidth: CGFloat = 22
            let sizeHeight: CGFloat = 22
            let cornerRadius: CGFloat = 7
            let padding: CGFloat = 5
            let backgroundPadding: CGFloat = 4
            let foregroundColor = pickerData.symbolName.wrappedValue == systemImage ? invertedColor : primaryColor.opacity(0.8)
            let backgroundColor = primaryColor.opacity(pickerData.symbolName.wrappedValue == systemImage ? 0.25 : 0)
            #endif
            if #available(macOS 13.0, iOS 16.0, *) {
                Image(systemName: systemImage)
                    .imageScale(.large)
                    .frame(width: sizeWidth, height: sizeHeight)
                    .fontWeight(.medium)
                    .padding(.vertical, padding)
                    .padding(.horizontal, padding)
                    .background(backgroundColor)
                    .spForegroundStyle(foregroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                    .padding(.vertical, 4)
                    .padding(.horizontal, backgroundPadding)
                    .background(.gray.opacity(0.001))
                    .accessibilityElement()
                    .accessibilityLabel(description)
                    .accessibilityAddTraits([.isButton, .isImage])
            } else {
                Image(systemName: systemImage)
                    .imageScale(.large)
                    .frame(width: sizeWidth, height: sizeHeight)
                    .padding(.vertical, padding)
                    .padding(.horizontal, padding)
                    .background(backgroundColor)
                    .spForegroundStyle(foregroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                    .padding(.vertical, 4)
                    .padding(.horizontal, backgroundPadding)
                    .background(Color.gray.opacity(0.001))
                    .accessibilityElement()
                    .accessibilityLabel(description)
                    .accessibilityAddTraits([.isButton, .isImage])
            }
        }
        .buttonStyle(.plain)
    }
    

    public init(for data: SymbolPickerData) {
        self.pickerData = data
    }
    

}
