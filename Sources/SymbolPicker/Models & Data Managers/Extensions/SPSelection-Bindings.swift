//
//  SPSelection-BindingImageLogic.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//


import SwiftUI
import ColorKit
import PhotosUI

// MARK: - Generic Support
public extension Binding where Value: SPSelectionProtocol {
    var asImageOffsetY: Binding<Double> { _asImageOffsetY }
    var asImageOffsetX: Binding<Double> { _asImageOffsetX }
    var asZoom: Binding<Double> { _asZoom }
    var asCKColor: Binding<CKColor> { _asCKColor }
    
    #if !os(tvOS) && !os(watchOS)
    @available(iOS 16.0, macOS 13.0, *)
    var asImage: Binding<PhotosPickerItem?> { _asImage }
    #endif
}

// MARK: - Existential Support
public extension Binding where Value == any SPSelectionProtocol {
    var asImageOffsetY: Binding<Double> { _asImageOffsetY }
    var asImageOffsetX: Binding<Double> { _asImageOffsetX }
    var asZoom: Binding<Double> { _asZoom }
    var asCKColor: Binding<CKColor> { _asCKColor }
    
    #if !os(tvOS) && !os(watchOS)
    @available(iOS 16.0, macOS 13.0, *)
    var asImage: Binding<PhotosPickerItem?> { _asImage }
    #endif
}

// MARK: - Private Implementation
private extension Binding {
    
    var _asImageOffsetY: Binding<Double> {
        Binding<Double>{
            (self.wrappedValue as? any SPSelectionProtocol)?.getImage()?.offsetY ?? 1.0
        } set: { newValue in
            if var proto = self.wrappedValue as? any SPSelectionProtocol,
               var updatedImage = proto.getImage() {
                updatedImage.offsetY = newValue
                proto.setImage(updatedImage)
                if let final = proto as? Value { self.wrappedValue = final }
            }
        }
    }
    
    var _asImageOffsetX: Binding<Double> {
        Binding<Double>{
            (self.wrappedValue as? any SPSelectionProtocol)?.getImage()?.offsetX ?? 0.0
        } set: { newValue in
            if var proto = self.wrappedValue as? any SPSelectionProtocol,
               var updatedImage = proto.getImage() {
                updatedImage.offsetX = newValue
                proto.setImage(updatedImage)
                if let final = proto as? Value { self.wrappedValue = final }
            }
        }
    }

    var _asZoom: Binding<Double> {
        Binding<Double>{
            (self.wrappedValue as? any SPSelectionProtocol)?.getImage()?.zoom ?? 0.0
        } set: { newValue in
            if var proto = self.wrappedValue as? any SPSelectionProtocol,
               var updatedImage = proto.getImage() {
                updatedImage.zoom = newValue
                proto.setImage(updatedImage)
                if let final = proto as? Value { self.wrappedValue = final }
            }
        }
    }
    
    var _asCKColor: Binding<CKColor> {
        Binding<CKColor>(
            get: {
                (self.wrappedValue as? any SPSelectionProtocol)?.getColor() ?? CKColor(red: 0, green: 0, blue: 0, opacity: 0)
            },
            set: { newItem in
                if var proto = self.wrappedValue as? any SPSelectionProtocol {
                    proto.setColor(newItem)
                    if let final = proto as? Value { self.wrappedValue = final }
                }
            }
        )
    }
    
    #if !os(tvOS) && !os(watchOS)
    @available(iOS 16.0, macOS 13.0, *)
    var _asImage: Binding<PhotosPickerItem?> {
        Binding<PhotosPickerItem?>(
            get: { nil },
            set: { newItem in
                guard let newItem else { return }
                
                Task { @MainActor in
                    guard let result = await performAsyncImageLoading(newItem) else { return }
                    
                    if var proto = self.wrappedValue as? any SPSelectionProtocol {
                        proto.setImage(result.image)
                        if let detectedColor = result.color {
                            proto.setColor(detectedColor)
                        }
                        if let final = proto as? Value {
                            self.wrappedValue = final
                        }
                    }
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
