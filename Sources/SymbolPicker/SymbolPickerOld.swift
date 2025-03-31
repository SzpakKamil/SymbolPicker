//
//  SymbolPickerOld.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 5/12/24.
//

import SwiftUI

@available(macOS 11.0, *)
@available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ SymbolPicker(for: SymbolPickerData)")
public struct SymbolPickerOld: View {
    public var pickerData: SymbolPickerData
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText = ""



    public var body: some View {
        VStack{
            if pickerData.colorValue?.wrappedValue == .clear{
                colorPicker
            }
            if #available(macOS 13.0, *) {
                searchField
                    .padding(.top, pickerData.colorValue?.wrappedValue != .clear ? 0 : 10)
            }
            symbolsList
            Spacer()
        }
        .frame(width: 310, height: 430)
    }


    @available(macOS 13.0, *)
    @ViewBuilder public var searchField: some View{
        List{}
            .offset(y: -10)
            .listStyle(.sidebar)
            .scrollContentBackground(.hidden)
            .searchable(text: $searchText, placement: .sidebar, prompt: "Search Symbols")
            .scrollDisabled(true)
            .frame(height: 41)
    }
    
    @ViewBuilder public var colorPicker: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 21, maximum: 21))]){
            ForEach(SymbolColor.allCases){
                colorOption(for: $0)
            }
        }
        .padding(.top, 12)
        .padding(.horizontal, 7)
        
        Divider()
    }
    
    @ViewBuilder public var symbolsList: some View {
        let symbolDictionary = pickerData.useFilledSymbols ? pickerData.symbolDictionaryFilled : pickerData.symbolDictionaryNotFilled
        ScrollView(.vertical) {
            if searchText.isEmpty {
                let keys = symbolDictionary.keys.sorted { Int($0.components(separatedBy: "_")[0]) ?? 0 < Int($1.components(separatedBy: "_")[0]) ?? 0 }
                ForEach(keys, id: \.self) { key in
                    Section {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 28, maximum: 28))]) {
                            ForEach(symbolDictionary[key]?.keys.sorted() ?? [], id: \.self) { symbolName in
                                if let symbolDescription = symbolDictionary[key]?[symbolName] {
                                    symbolButton(for: symbolName, description: symbolDescription)
                                }
                            }
                        }
                        .offset(y: -3)
                    } header: {
                        HStack {
                            Text(key.components(separatedBy: "_").last ?? "")
                                .font(.callout)
                                .fontWeight(.medium)
                                .spForegroundStyle(Color.primary.opacity(0.4))
                                .padding(.horizontal, 5)
                            Spacer()
                        }
                    }
                }
                .drawingGroup()
                .padding(.horizontal, 12)
            } else {
                let sortedKeys = getFilteredSymbolKeys(from: symbolDictionary, matching: searchText)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 28, maximum: 28))]) {
                    ForEach(sortedKeys, id: \.self) { symbolName in
                        let description = getSymbolDescription(for: symbolName, in: symbolDictionary)
                        symbolButton(for: symbolName, description: description)
                    }
                }
                .drawingGroup()
                .offset(y: -3)
                .padding(.horizontal, 12)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipped()
        .offset(y: -17)
        .padding(.top, 5)
    }
    
    // Helper function to get filtered and sorted symbol keys
    private func getFilteredSymbolKeys(from dictionary: [String: [String: String]], matching searchText: String) -> [String] {
        var uniqueSymbols = Set<String>()
        
        for (_, sectionSymbols) in dictionary {
            for (symbolName, symbolDescription) in sectionSymbols {
                if symbolDescription.localizedStandardContains(searchText) {
                    uniqueSymbols.insert(symbolName)
                }
            }
        }
        
        return uniqueSymbols.sorted()
    }

    // Helper function to get symbol description
    private func getSymbolDescription(for symbolName: String, in dictionary: [String: [String: String]]) -> String {
        for (_, sectionSymbols) in dictionary {
            if let description = sectionSymbols[symbolName] {
                return description
            }
        }
        return ""
    }
    
    public func colorOption(for color: SymbolColor) -> some View{
        Button{
            pickerData.colorValue?.wrappedValue = color.color
        }label:{
            Image(systemName: pickerData.colorValue?.wrappedValue == color.color ? "checkmark.circle.fill" : "circle.fill")
                .resizable()
                .scaledToFit()
                .overlay(
                    Circle()
                        .stroke(.black.opacity(0.05), lineWidth: 3)
                )
                .clipShape(.circle)
                .padding(2)
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
                pickerData.isPresented.wrappedValue = false
            }
        }label:{
            Image(systemName: systemImage)
                .imageScale(.large)
                .frame(width: 22, height: 22)
                .padding(.vertical, 5)
                .padding(.horizontal, 5)
                .background(primaryColor.opacity(pickerData.symbolName.wrappedValue == systemImage ? 0.25 : 0))
                .spForegroundStyle(pickerData.symbolName.wrappedValue == systemImage ? invertedColor : primaryColor.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous))
                .padding(.vertical, 4)
                .padding(.horizontal, 4)
                .background(Color.gray.opacity(0.001))
                .accessibilityElement()
                .accessibilityLabel(description)
                .accessibilityAddTraits([.isButton, .isImage])
        }
        .buttonStyle(.plain)
    }
    

    
    public init(for data: SymbolPickerData) {
        self.pickerData = data
    }
}

