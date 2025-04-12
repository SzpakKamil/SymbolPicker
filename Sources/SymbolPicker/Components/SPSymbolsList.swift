//
//  SPSymbolsList.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 12/04/2025.
//

import SwiftUI
import SearchBar

struct SPSymbolsList: View {
    @Binding var searchText: String
    let pickerData: SymbolPickerData
    let loadedSymbols: [SymbolSection]
    var geo: GeometryProxy
    var body: some View {
        if #available(iOS 15.0, macOS 12.0, visionOS 1.0, *){
            SPSymbolsListNew(searchText: $searchText, pickerData: pickerData, loadedSymbols: loadedSymbols, geo: geo)
        }else{
            SPSymbolsListOld(searchText: $searchText, pickerData: pickerData, loadedSymbols: loadedSymbols, geo: geo)
        }
    }
}

struct SPSymbolsListContent: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var searchText: String
    let pickerData: SymbolPickerData
    let loadedSymbols: [SymbolSection]
    var geo: GeometryProxy
    var size1: CGFloat
    var size2: CGFloat
    let dismissalAction: () -> Void
    var body: some View {
        #if os(iOS)
        var sizeWidth: CGFloat = size1
        let sizeHeight: CGFloat = size1 * 1.1
        #elseif os(visionOS)
        let sizeWidth: CGFloat = 28
        let sizeHeight: CGFloat = 28
        #else
        let sizeWidth: CGFloat = 28
        let sizeHeight: CGFloat = 28
        #endif
        ScrollView {
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
                            symbolButton(for: symbol, geo: geo)
                        }
                    }
                    #if os(macOS)
                    .offset(y: -3)
                    #else
                    .padding(.horizontal, 4)
                    #endif
                } header: {
                    if !section.title.isEmpty{
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
    
    @ViewBuilder func symbolButton(for symbolModel: SymbolModel, geo: GeometryProxy) -> some View {
        let primaryColor = colorScheme == .dark ? Color.white : Color.black
        let invertedColor = colorScheme == .dark ? Color.white : Color.black
        #if os(iOS)
        var sizeWidth: CGFloat = size2
        let sizeHeight: CGFloat = size2 * 1.1
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
                dismissalAction()
            }
        }label:{
            Image(systemName: pickerData.useFilledSymbols ? symbolModel.filledSymbolName : symbolModel.notFilledSymbolName)
                .font(.title2)
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
    
}

@available(iOS 15.0, macOS 12.0, visionOS 1.0, *)
struct SPSymbolsListNew: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.dismiss) var dismiss
    @Binding var searchText: String
    let pickerData: SymbolPickerData
    let loadedSymbols: [SymbolSection]
    var geo: GeometryProxy
    var size1: CGFloat{
        switch dynamicTypeSize{
        case .xSmall: return geo.size.width * 0.07
        case .small: return geo.size.width * 0.085
        case .medium: return geo.size.width * 0.09
        case .large: return geo.size.width * 0.084
        case .xLarge: return geo.size.width * 0.11
        case .xxLarge: return geo.size.width * 0.13
        case .xxxLarge: return geo.size.width * 0.13
        case .accessibility1: return geo.size.width * 0.13
        case .accessibility2: return geo.size.width * 0.17
        case .accessibility3: return geo.size.width * 0.17
        case .accessibility4: return geo.size.width * 0.17
        case .accessibility5: return geo.size.width * 0.23
        @unknown default: return geo.size.width * 0.135
        }
    }
    var size2: CGFloat{
        switch dynamicTypeSize{
        case .xSmall: return geo.size.width * 0.07
        case .small: return geo.size.width * 0.075
        case .medium: return geo.size.width * 0.085
        case .large: return geo.size.width * 0.08
        case .xLarge: return geo.size.width * 0.09
        case .xxLarge: return geo.size.width * 0.10
        case .xxxLarge: return geo.size.width * 0.12
        case .accessibility1: return geo.size.width * 0.13
        case .accessibility2: return geo.size.width * 0.16
        case .accessibility3: return geo.size.width * 0.16
        case .accessibility4: return geo.size.width * 0.17
        case .accessibility5: return geo.size.width * 0.19
        @unknown default: return geo.size.width * 0.135
        }
    }
    var body: some View {
        SPSymbolsListContent(searchText: $searchText, pickerData: pickerData, loadedSymbols: loadedSymbols, geo: geo, size1: size1, size2: size2) {
            dismiss()
        }
    }
}

struct SPSymbolsListOld: View {
    @Environment(\.sizeCategory) var sizeCategory
    @Binding var searchText: String
    let pickerData: SymbolPickerData
    let loadedSymbols: [SymbolSection]
    var geo: GeometryProxy
    var size1: CGFloat{
        switch sizeCategory{
        case .extraSmall: return geo.size.width * 0.07
        case .small: return geo.size.width * 0.085
        case .medium: return geo.size.width * 0.09
        case .large: return geo.size.width * 0.084
        case .extraLarge: return geo.size.width * 0.11
        case .extraExtraLarge: return geo.size.width * 0.13
        case .extraExtraExtraLarge: return geo.size.width * 0.13
        case .accessibilityMedium: return geo.size.width * 0.13
        case .accessibilityLarge: return geo.size.width * 0.17
        case .accessibilityExtraLarge: return geo.size.width * 0.17
        case .accessibilityExtraExtraLarge: return geo.size.width * 0.17
        case .accessibilityExtraExtraExtraLarge: return geo.size.width * 0.23
        @unknown default: return geo.size.width * 0.135
        }
    }
    var size2: CGFloat{
        switch sizeCategory{
        case .extraSmall: return geo.size.width * 0.07
        case .small: return geo.size.width * 0.075
        case .medium: return geo.size.width * 0.085
        case .large: return geo.size.width * 0.08
        case .extraLarge: return geo.size.width * 0.09
        case .extraExtraLarge: return geo.size.width * 0.10
        case .extraExtraExtraLarge: return geo.size.width * 0.12
        case .accessibilityMedium: return geo.size.width * 0.13
        case .accessibilityLarge: return geo.size.width * 0.16
        case .accessibilityExtraLarge: return geo.size.width * 0.16
        case .accessibilityExtraExtraLarge: return geo.size.width * 0.17
        case .accessibilityExtraExtraExtraLarge: return geo.size.width * 0.19
        @unknown default: return geo.size.width * 0.135
        }
    }
    
    var body: some View {
        SPSymbolsListContent(searchText: $searchText, pickerData: pickerData, loadedSymbols: loadedSymbols, geo: geo, size1: size1, size2: size2) {
            pickerData.isPresented.wrappedValue = false
        }
    }
}
