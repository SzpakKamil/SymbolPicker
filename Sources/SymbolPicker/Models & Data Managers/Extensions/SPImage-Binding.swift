//
//  SPImage-Binding.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI
import PhotosUI

#if !os(tvOS) && !os(watchOS)
@available(iOS 16.0, macOS 13.0, *)
public extension Binding where Value == SPImage {
    var asPhotosPickerItem: Binding<PhotosPickerItem?> {
        Binding<PhotosPickerItem?>(
            get: { nil },
            set: { newItem in
                guard let newItem else { return }
                
                Task(priority: .userInitiated) {
                    guard let data = try? await newItem.loadTransferable(type: Data.self) else { return }
                    
                    let timestamp = Int(Date().timeIntervalSince1970)
                    let generatedName = "IMG_\(timestamp)"
                    
                    let newImage = SPImage(
                        fileName: generatedName,
                        rawData: data
                    )
                    
                    await MainActor.run {
                        self.wrappedValue = newImage
                    }
                }
            }
        )
    }
}
#endif
