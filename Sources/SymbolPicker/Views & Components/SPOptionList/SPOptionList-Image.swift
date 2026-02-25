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
        List {
            ForEach(style.getViews(for: .scrollContentTop).indices, id: \.self){ index in
                style.getViews(for: .scrollContentTop)[index].view
            }
            ColorPicker(SPTranslation.DetectedColor.localizedDescription, selection: spSelection.asCKColor.asColor)
            
            Section(SPTranslation.Source.localizedDescription) {
                PhotosPicker(SPTranslation.SelectImage.localizedDescription, selection: spSelection.asImage)
            }
            
            if let image = spSelection.wrappedValue.getImage() {
                Section(SPTranslation.Manipulation.localizedDescription) {
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
            }
            ForEach(style.getViews(for: .scrollContentBottom).indices, id: \.self){ index in
                style.getViews(for: .scrollContentBottom)[index].view
            }
        }
#if os(macOS)
        .listStyle(.sidebar)
#endif
    }
}
#endif
