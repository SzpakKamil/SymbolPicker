//
//  SPPagePicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public struct SPPagePicker: View {
    @Environment(\.spPageType) var spPageType
    @Environment(\.spAllowedPageTypes) var spAllowedPageTypes
    @Environment(\.spHorizontalPadding) var spHorizontalPadding
    @Environment(\.symbolPickerStyle) var style
    
    @_documentation(visibility: internal)
    public var body: some View {
        let filteredTypes = style.supportedTypes.filter { spAllowedPageTypes.contains($0) }
        let supportedTypes = filteredTypes.isEmpty ? spAllowedPageTypes : filteredTypes
        let supportedTypesCount = supportedTypes.count
        
        if supportedTypesCount > 1 {
            #if os(watchOS)
            if spPageType.wrappedValue == .emoji {
                Button(SPPageType.symbol.localizedDescription, systemImage: SPPageType.symbol.systemName) {
                    spPageType.wrappedValue = .symbol
                }
            } else {
                Button(SPPageType.emoji.localizedDescription, systemImage: SPPageType.emoji.systemName) {
                    spPageType.wrappedValue = .emoji
                }
            }
            #else
            
            // Using the resolved supportedTypes for the Picker
            Picker(SPTranslation.PageType.localizedDescription, selection: spPageType) {
                ForEach(supportedTypes) { type in
                    #if os(macOS)
                    if #available(macOS 26.0, *) {
                        if supportedTypesCount == 2 {
                            Text("           \(type.localizedDescription)           ")
                                .tag(type)
                        } else {
                            Text("     \(type.localizedDescription)    ")
                                .tag(type)
                        }
                    } else {
                        if supportedTypesCount == 2 {
                            Text(" \(type.localizedDescription)           ")
                                .tag(type)
                        } else {
                            Text(" \(type.localizedDescription)    ")
                                .tag(type)
                        }
                    }
                    #elseif os(tvOS)
                    if #available(tvOS 26.0, *) {
                        Text(type.localizedDescription)
                            .tag(type)
                    } else {
                        if style.displayStyle == .compact {
                            Text("‎‎‎‎ ‎ ‎ ‎ ‎ ‎  ‎ ‎ ‎ ‎ ‎ \(type.localizedDescription) ‎ ‎ ‎ ‎  ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎  ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎  ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎  ")
                                .tag(type)
                        } else {
                            Text("‎‎‎‎ ‎ ‎ ‎ ‎ ‎ \(type.localizedDescription) ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎  ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎  ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎  ")
                                .tag(type)
                        }
                    }
                    #else
                    Text(type.localizedDescription)
                        .tag(type)
                    #endif
                }
            }
            .labelsHidden()
            .pickerStyle(.segmented)
            #if os(visionOS)
            .if{ content in
                if #available(visionOS 26.0, *){ content.padding(.top, -3) }else{ content.padding(.top, 3) }
            }
            .padding(.top, 3)
            #endif
            .padding(.horizontal, spHorizontalPadding * 0.90)
            #endif
        }
    }
    
    public init() {}
}
