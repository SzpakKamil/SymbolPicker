//
//  SPSelection-Bindings.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit
import PhotosUI

// MARK: - Generic Support
extension Binding where Value: SPSelectionProtocol {
    var asImageOffsetY: Binding<Double> {
        Binding<Double> {
            self.wrappedValue.getImage()?.offsetY ?? 1.0
        } set: { newValue in
            var photo = self.wrappedValue
            if var updatedImage = self.wrappedValue.getImage() {
                updatedImage.offsetY = newValue
                photo.setImage(updatedImage)
                self.wrappedValue = photo
            }
        }
    }
    var asImageOffsetX: Binding<Double> {
        Binding<Double> {
            self.wrappedValue.getImage()?.offsetX ?? 1.0
        } set: { newValue in
            var photo = self.wrappedValue
            if var updatedImage = self.wrappedValue.getImage() {
                updatedImage.offsetX = newValue
                photo.setImage(updatedImage)
                self.wrappedValue = photo
            }
        }
    }
    var asZoom: Binding<Double> {
        Binding<Double> {
            self.wrappedValue.getImage()?.zoom ?? 1.0
        } set: { newValue in
            var photo = self.wrappedValue
            if var updatedImage = self.wrappedValue.getImage() {
                updatedImage.zoom = newValue
                photo.setImage(updatedImage)
                self.wrappedValue = photo
            }
        }
    }
    var asCKColor: Binding<CKColor> {
        Binding<CKColor>(
            get: {
                self.wrappedValue.getColor() ?? CKColor(red: 0, green: 0, blue: 0, opacity: 0)
            },
            set: { newItem in
                var copy = self.wrappedValue
                copy.setColor(newItem)
                self.wrappedValue = copy
            }
        )
    }
    
    #if !os(tvOS) && !os(watchOS)
    @available(iOS 16.0, macOS 13.0, *)
    var asImage: Binding<PhotosPickerItem?> {
        Binding<PhotosPickerItem?>(
            get: { nil },
            set: { newItem in
                guard let newItem else { return }
                
                Task { @MainActor in
                    guard let result = await performAsyncImageLoading(newItem) else { return }
                    var photo = self.wrappedValue
                    photo.setImage(result.image)
                    if let detectedColor = result.color {
                        photo.setColor(detectedColor)
                    }
                    self.wrappedValue = photo
                }
            }
        )
    }
    #endif
}

// MARK: - Existential Support
public extension Binding where Value == any SPSelectionProtocol {
    var asImageOffsetY: Binding<Double> {
        Binding<Double> {
            self.wrappedValue.getImage()?.offsetY ?? 1.0
        } set: { newValue in
            var photo = self.wrappedValue
            if var updatedImage = self.wrappedValue.getImage() {
                updatedImage.offsetY = newValue
                photo.setImage(updatedImage)
                self.wrappedValue = photo
            }
        }
    }
    var asImageOffsetX: Binding<Double> {
        Binding<Double> {
            self.wrappedValue.getImage()?.offsetX ?? 1.0
        } set: { newValue in
            var photo = self.wrappedValue
            if var updatedImage = self.wrappedValue.getImage() {
                updatedImage.offsetX = newValue
                photo.setImage(updatedImage)
                self.wrappedValue = photo
            }
        }
    }
    var asZoom: Binding<Double> {
        Binding<Double> {
            self.wrappedValue.getImage()?.zoom ?? 1.0
        } set: { newValue in
            var photo = self.wrappedValue
            if var updatedImage = self.wrappedValue.getImage() {
                updatedImage.zoom = newValue
                photo.setImage(updatedImage)
                self.wrappedValue = photo
            }
        }
    }
    var asCKColor: Binding<CKColor> {
        Binding<CKColor>(
            get: {
                self.wrappedValue.getColor() ?? CKColor(red: 0, green: 0, blue: 0, opacity: 0)
            },
            set: { newItem in
                var copy = self.wrappedValue
                copy.setColor(newItem)
                self.wrappedValue = copy
            }
        )
    }
    
    #if !os(tvOS) && !os(watchOS)
    @available(iOS 16.0, macOS 13.0, *)
    var asImage: Binding<PhotosPickerItem?> {
        Binding<PhotosPickerItem?>(
            get: { nil },
            set: { newItem in
                guard let newItem else { return }
                
                Task { @MainActor in
                    guard let result = await performAsyncImageLoading(newItem) else { return }
                    var photo = self.wrappedValue
                    photo.setImage(result.image)
                    if let detectedColor = result.color {
                        photo.setColor(detectedColor)
                    }
                    self.wrappedValue = photo
                }
            }
        )
    }
    #endif
}
#if !os(tvOS) && !os(watchOS)
@available(iOS 16.0, macOS 13.0, *)
private func performAsyncImageLoading(_ item: PhotosPickerItem) async -> (image: SPImage, color: CKColor?)? {
    guard let data = try? await item.loadTransferable(type: Data.self) else { return nil }
    
    let timestamp = Int(Date().timeIntervalSince1970)
    let generatedName = "IMG_\(timestamp)"
    
    var width: Double = 0
    var height: Double = 0
    var detectedColor: CKColor? = nil
    
    #if os(iOS) || os(visionOS)
    if let image = UIImage(data: data) {
        width = Double(image.size.width)
        height = Double(image.size.height)
        detectedColor = CKColor(nativeColor: image.averageColor() ?? .black)
    }
    #elseif os(macOS)
    if let image = NSImage(data: data) {
        width = Double(image.size.width)
        height = Double(image.size.height)
        detectedColor = CKColor(nativeColor: image.averageColor() ?? .black)
    }
    #endif
    
    let newImage = SPImage(
        fileName: generatedName,
        rawData: data,
        width: width,
        height: height
    )
    
    return (newImage, detectedColor)
}
#endif
