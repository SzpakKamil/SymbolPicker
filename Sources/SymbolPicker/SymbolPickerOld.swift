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
    var pickerData: SymbolPickerData
    @State private var searchText = ""
    
    
    #if !os(macOS)
    var usePopover: Bool{
        if #available(iOS 17.0, *) {
            UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .vision
        } else {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    #endif
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
                selectedSymbolView
                if pickerData.colorValue?.wrappedValue != .clear{ colorPicker }
                symbolsList
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
            .padding(.top, usePopover ? 0 : -30)
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
        #if os(iOS) || os(visionOS)
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
        let outlineColor = Color.black
        #else
        #if os(visionOS)
        let outlineColor = Color.primary
        #else
        let outlineColor = Color.white
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
    
    @ViewBuilder func symbolButton(for systemImage: String, description: String) -> some View {
        let primaryColor = colorScheme == .dark ? Color.white : Color.black
        let invertedColor = colorScheme == .dark ? Color.white : Color.black
        #if os(iOS)
        let sizeWidth: CGFloat = 28
        let sizeHeight: CGFloat = 32
        let cornerRadius: CGFloat = 9
        let padding: CGFloat = 5
        let backgroundPadding: CGFloat = 4
        let foregroundColor = primaryColor.opacity(0.4)
        let backgroundColor = primaryColor.opacity(pickerData.symbolName.wrappedValue == systemImage ? 0.1 : 0)
        #elseif os(visonOS)
        let sizeWidth: CGFloat = 22
        let sizeHeight: CGFloat = 22
        let cornerRadius: CGFloat = 15
        let padding: CGFloat = 7
        let backgroundPadding: CGFloat = 1
        let foregroundColor = primaryColor.opacity(0.4)
        let backgroundColor = primaryColor.opacity(pickerData.symbolName.wrappedValue == systemImage ? 0.1 : 0)
        #else
        let sizeWidth: CGFloat = 22
        let sizeHeight: CGFloat = 22
        let cornerRadius: CGFloat = 7
        let padding: CGFloat = 5
        let backgroundPadding: CGFloat = 4
        let foregroundColor = pickerData.symbolName.wrappedValue == systemImage ? invertedColor :       primaryColor.opacity(0.8)
        let backgroundColor = primaryColor.opacity(pickerData.symbolName.wrappedValue == systemImage ? 0.25 : 0)
        #endif
        Button{
            pickerData.symbolName.wrappedValue = systemImage
            if pickerData.dismissOnSymbolChange{
                pickerData.isPresented.wrappedValue = false
            }
        }label:{
            Image(systemName: systemImage)
                .imageScale(.large)
                .frame(width: sizeWidth, height: sizeHeight)
                .padding(.vertical, padding)
                .padding(.horizontal, padding)
                .background(backgroundColor)
                .spForegroundStyle(foregroundColor)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                .padding(.vertical, 4)
                .background(Color.gray.opacity(0.001))
        }
        .accessibilityElement()
        .accessibilityLabel(description)
        .accessibilityAddTraits([.isButton, .isImage])
        .buttonStyle(.plain)
        .padding(.horizontal, backgroundPadding)
    }
    

    public init(for data: SymbolPickerData) {
        self.pickerData = data
    }
}

