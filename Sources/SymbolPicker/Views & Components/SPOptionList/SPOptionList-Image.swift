//
//  SPOptionList-Image.swift
//  SymbolPicker
//
//  Refactored for modularity, performance, and improved skin selection.
//

import SwiftUI
import PhotosUI
import SearchBar
import ColorKit

// MARK: - Main View

#if os(iOS) || os(macOS) || os(visionOS)
@available(iOS 16.0, macOS 14.0, *)
struct SPOptionListImage: View {
    @Environment(\.symbolPickerStyle) var style
    @Environment(\.spSelection) var spSelection
    var body: some View{
        VStack{
            Section {
                VStack{
                    ColorPicker(selection: spSelection.asCKColor.asColor) {
                        HStack{
                            Text(SPTranslation.DetectedColor.localizedDescription)
                            Spacer()
                        }
                    }
                    #if !os(macOS)
                        .padding(.top, 10)
                        .padding(.bottom, 5)
                    #endif
                    #if !os(macOS)
                    Divider()
                    #endif
                    HStack{
                        PhotosPicker(SPTranslation.SelectImage.localizedDescription, selection: spSelection.asImage)
                        Spacer()
                    }
                    #if !os(macOS)
                    .padding(.bottom, 10)
                    .padding(.top, 5)
                    #endif
                }
                #if os(iOS)
                .spListStyleRow(forceListStyle: true)
                #endif
            } header: {
                SPHeaderView(title: SPTranslation.Source.localizedDescription)
                #if os(iOS)
                    .padding(.horizontal, 5)
                #endif
            }
            
            if let image = spSelection.wrappedValue.getImage() {
                Section {
                    VStack{
                        VStack(alignment: .leading) {
                            Text(SPTranslation.Zoom.localizedDescription)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Slider(value: spSelection.asZoom, in: 1.0...5.0)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(SPTranslation.HorizontalOffset.localizedDescription)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Slider(value: spSelection.asImageOffsetX, in: -1.0...1.0)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(SPTranslation.VerticalOffset.localizedDescription)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Slider(value: spSelection.asImageOffsetY, in: -1.0...1.0)
                        }
                    }
                    #if os(iOS)
                    .padding(.vertical, 10)
                    .spListStyleRow(forceListStyle: true)
                    #endif
                } header: {
                    SPHeaderView(title: SPTranslation.Manipulation.localizedDescription)
                    #if os(iOS)
                        .padding(.horizontal, 5)
                    #endif
                }
            }
        }

    }
}
#endif
