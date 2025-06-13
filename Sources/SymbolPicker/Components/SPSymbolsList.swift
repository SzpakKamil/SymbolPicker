//
//  SPSymbolsList.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 12/04/2025.
//

import SwiftUI
import SearchBar

@_documentation(visibility: internal)
struct SPSymbolsList: View, @MainActor Equatable {
    @Binding var searchText: String
    @Binding var symbolName: String
    var isUsingFilledSymbols: Bool
    var dismissType: SymbolPickerDismissType
    let loadedSymbols: [SymbolSection]
    var geo: GeometryProxy
    @Binding var isPresented: Bool
    var body: some View {
        if #available(iOS 15.0, macOS 12.0, visionOS 1.0, *){
            SPSymbolsListNew(searchText: $searchText, symbolName: $symbolName, isUsingFilledSymbols: isUsingFilledSymbols, dismissType: dismissType, loadedSymbols: loadedSymbols, geo: geo)
        }else{
            SPSymbolsListOld(searchText: $searchText, symbolName: $symbolName, isPresented: $isPresented, isUsingFilledSymbols: isUsingFilledSymbols, dismissType: dismissType, loadedSymbols: loadedSymbols, geo: geo)
        }
    }
    
    init(searchText: Binding<String>, symbolName: Binding<String>, isUsingFilledSymbols: Bool, dismissType: SymbolPickerDismissType, loadedSymbols: [SymbolSection], geo: GeometryProxy, isPresented: Binding<Bool>) {
        self._searchText = searchText
        self._symbolName = symbolName
        self.isUsingFilledSymbols = isUsingFilledSymbols
        self.dismissType = dismissType
        self.loadedSymbols = loadedSymbols
        self.geo = geo
        self._isPresented = isPresented
    }
    
    @MainActor static func ==(lhs: SPSymbolsList, rhs: SPSymbolsList) -> Bool{
        lhs.loadedSymbols == rhs.loadedSymbols
    }
}

@_documentation(visibility: internal)
struct SPSymbolsListContent: View, @MainActor Equatable {
    @Environment(\.colorScheme) var colorScheme
    @Binding var searchText: String
    @Binding var symbolName: String
    var isUsingFilledSymbols: Bool
    var dismissType: SymbolPickerDismissType
    let loadedSymbols: [SymbolSection]
    var geo: GeometryProxy
    var size1: CGFloat
    var size2: CGFloat
    let dismissalAction: () -> Void
    var color: Color?{
        colorScheme == .dark ? Color.white.opacity(0.1) : Color.black.opacity(0.075)
    }
    var body: some View {
        ScrollView {
#if os(iOS)
            var sizeWidth: CGFloat = size1
            let sizeHeight: CGFloat = size1 * 1.1
#elseif os(visionOS)
            let sizeWidth: CGFloat = size1
            let sizeHeight: CGFloat = size1 * 1.1
#else
            let sizeWidth: CGFloat = 28
            let sizeHeight: CGFloat = 28
#endif
            
#if !os(macOS)
            SearchBar(text: $searchText, prompt: "Search Symbols")
                .if{ content in
                    if #available(iOS 26.0, visionOS 26.0, *) {
                        content
#if os(iOS)
                            .searchBarStyle(cornerRadius: 15, backgroundColor: color)
                            .searchBarScale(.medium)
                            .padding(.bottom, -8)
                            .padding(.horizontal, -8)
#else
                            .searchBarStyle(.rectangle, backgroundColor: color)
#endif
                    } else {
                        content
                            .searchBarStyle(.rounded, backgroundColor: color)
#if os(iOS)
                            .padding(.bottom, -8)
                            .padding(.horizontal, -8)
#endif
                    }
                }
#if !os(iOS)
                .padding(.top, -5)
                .padding(.bottom, -20)
                .padding(.horizontal, -20)
#endif
#endif
            LazyVStack{
                ForEach(loadedSymbols) { section in
                    let symbols = section.symbols.filter{$0.isAvailable}
                    if symbols.count > 7{
                        Section {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: sizeWidth, maximum: sizeHeight))]) {
                                ForEach(symbols) { symbol in
                                    SPSymbolButton(symbolModel: symbol, symbolName: $symbolName, isUsingFilledSymbols: isUsingFilledSymbols, dismissType: dismissType, dismissalAction: dismissalAction, size: size2)
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
#if os(macOS)
                        .padding(.horizontal, 12)
#else
                        .padding(.horizontal, 3)
                        .padding(.top, 5)
#endif
                    }
                }
            }
        }
        #if os(macOS)
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipped()
        .offset(y: -17)
        .padding(.top, 5)
        #endif
    }
    
    @MainActor static func ==(lhs: SPSymbolsListContent, rhs: SPSymbolsListContent) -> Bool{
        lhs.loadedSymbols == rhs.loadedSymbols && lhs.size1 == rhs.size1 && lhs.size2 == rhs.size2
    }
}

@_documentation(visibility: internal)
@available(iOS 15.0, macOS 12.0, visionOS 1.0, *)
struct SPSymbolsListNew: View, @MainActor Equatable {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.dismiss) var dismiss
    @Binding var searchText: String
    @Binding var symbolName: String
    var isUsingFilledSymbols: Bool
    var dismissType: SymbolPickerDismissType
    let loadedSymbols: [SymbolSection]
    var geo: GeometryProxy
    var size1: CGFloat{
        #if os(visionOS)
        switch dynamicTypeSize{
        case .xSmall: return geo.size.width * 0.09
        case .small: return geo.size.width * 0.095
        case .medium: return geo.size.width * 0.095
        case .large: return geo.size.width * 0.095
        case .xLarge: return geo.size.width * 0.15
        default: return geo.size.width * 0.15
        }
        #else
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
        #endif
    }
    var size2: CGFloat{
        #if os(visionOS)
        switch dynamicTypeSize{
        case .xSmall: return geo.size.width * 0.09
        case .small: return geo.size.width * 0.095
        case .medium: return geo.size.width * 0.095
        case .large: return geo.size.width * 0.095
        case .xLarge: return geo.size.width * 0.15
        default: return geo.size.width * 0.15
        }
        #else
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
        #endif
    }
    var body: some View {
        SPSymbolsListContent(searchText: $searchText, symbolName: $symbolName, isUsingFilledSymbols: isUsingFilledSymbols, dismissType: dismissType, loadedSymbols: loadedSymbols, geo: geo, size1: size1, size2: size2) {
            dismiss()
        }
    }
    
    @MainActor static func ==(lhs: SPSymbolsListNew, rhs: SPSymbolsListNew) -> Bool{
        lhs.loadedSymbols == rhs.loadedSymbols
    }
}

@_documentation(visibility: internal)
struct SPSymbolsListOld: View, @MainActor Equatable {
    @Environment(\.sizeCategory) var sizeCategory
    @Binding var searchText: String
    @Binding var symbolName: String
    @Binding var isPresented: Bool
    var isUsingFilledSymbols: Bool
    var dismissType: SymbolPickerDismissType
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
        SPSymbolsListContent(searchText: $searchText, symbolName: $symbolName, isUsingFilledSymbols: isUsingFilledSymbols, dismissType: dismissType, loadedSymbols: loadedSymbols, geo: geo, size1: size1, size2: size2) {
            isPresented = false
        }
    }
    
    
    @MainActor static func ==(lhs: SPSymbolsListOld, rhs: SPSymbolsListOld) -> Bool{
        lhs.loadedSymbols == rhs.loadedSymbols
    }
}


struct SPSymbolButton: View, @MainActor Equatable{
    @Environment(\.colorScheme) var colorScheme
    var symbolModel: SymbolModel
    @Binding var symbolName: String
    var isUsingFilledSymbols: Bool
    var dismissType: SymbolPickerDismissType
    var dismissalAction: () -> Void
    var size: CGFloat
    
    var isSelected: Bool{
        symbolName == (isUsingFilledSymbols ? symbolModel.filledSymbolName : symbolModel.notFilledSymbolName)
    }
    var body: some View{
        let primaryColor = colorScheme == .dark ? Color.white : Color.black
        let invertedColor = colorScheme == .dark ? Color.white : Color.black
        #if os(iOS)
        var sizeWidth: CGFloat = size
        let sizeHeight: CGFloat = size * 1.1
        var cornerRadius: CGFloat{
            if #available(iOS 26.0, visionOS 26.0, *){
                return 12
            }else{
                return 9
            }
        }
        let padding: CGFloat = 5
        let backgroundPadding: CGFloat = 4
        var foregroundColor: Color{
            if #available(iOS 26.0, visionOS 26.0, *){
                if isSelected{
                    return Color.blue.opacity(0.9)
                }else{
                    return primaryColor.opacity(0.5)
                }
            }else{
                return primaryColor.opacity(0.4)
            }
        }

        var backgroundColor: Color{
            if #available(iOS 26.0, visionOS 26.0, *){
                Color.blue.opacity(isSelected ? 0.2 : 0)
            }else{
                primaryColor.opacity(isSelected ? 0.1 : 0)
            }
        }

        #elseif os(visionOS)
        let sizeWidth: CGFloat = 22
        let sizeHeight: CGFloat = 22
        var cornerRadius: CGFloat{
            if #available(iOS 26.0, visionOS 26.0, *){
                return 11
            }else{
                return 7
            }
        }
        let padding: CGFloat = 9
        let backgroundPadding: CGFloat = 0
        var foregroundColor: Color{
            if #available(iOS 26.0, visionOS 26.0, *){
                if isSelected{
                    return Color.blue.opacity(0.9)
                }else{
                    return primaryColor.opacity(0.5)
                }
            }else{
                return primaryColor.opacity(0.4)
            }
        }

        var backgroundColor: Color{
            if #available(iOS 26.0, visionOS 26.0, *){
                Color.blue.opacity(isSelected ? 0.2 : 0)
            }else{
                primaryColor.opacity(isSelected ? 0.1 : 0)
            }
        }
        #else
        let sizeWidth: CGFloat = 22
        let sizeHeight: CGFloat = 22
        let cornerRadius: CGFloat = 7
        let padding: CGFloat = 7
        let backgroundPadding: CGFloat = 0
        let foregroundColor = isSelected ? invertedColor : primaryColor.opacity(0.8)
        let backgroundColor = primaryColor.opacity(isSelected ? 0.25 : 0)
        #endif
        Button{
            symbolName = isUsingFilledSymbols ? symbolModel.filledSymbolName : symbolModel.notFilledSymbolName
            if dismissType == .onSymbolSelect{
                dismissalAction()
            }
        }label:{
            Image(systemName: isUsingFilledSymbols ? symbolModel.filledSymbolName :  symbolModel.notFilledSymbolName)
            #if os(visionOS)
                .font(.title3)
            #else
                .font(.title2)
            #endif
                .frame(width: sizeWidth, height: sizeHeight)
                .if{ content in
                    if #available(macOS 13.0, iOS 16.0, visionOS 1.0, *) {
                        content.fontWeight(.medium)
                    }else{
                        content
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
        .accessibilityAddTraits(isSelected ? [.isButton, .isSelected] : [.isButton])
        #if os(visionOS)
        .buttonBorderShape(.roundedRectangle(radius: 8))
        .buttonStyle(.borderless)
        .dynamicTypeSize(...DynamicTypeSize.xLarge)
        #else
        .buttonStyle(.plain)
        #endif

        .padding(.horizontal, backgroundPadding)
    }
    
    @MainActor static func ==(lhs: SPSymbolButton, rhs: SPSymbolButton) -> Bool{
        if lhs.isUsingFilledSymbols && rhs.isUsingFilledSymbols{
            return (lhs.symbolName == lhs.symbolModel.filledSymbolName) == (rhs.symbolName == rhs.symbolModel.filledSymbolName) && lhs.size == rhs.size
        }else if !lhs.isUsingFilledSymbols && !rhs.isUsingFilledSymbols{
            return (lhs.symbolName == lhs.symbolModel.notFilledSymbolName) == (rhs.symbolName == rhs.symbolModel.notFilledSymbolName) && lhs.size == rhs.size
        }else{
            return lhs.size == rhs.size
        }
    }
}
