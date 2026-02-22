//
//  SPSelection-BindingImageLogic.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//


import SwiftUI
import ColorKit
import PhotosUI
public extension Binding where Value == SPSelection {
    
    var asImageOffsetY: Binding<Double> {
        Binding<Double>{
            self.wrappedValue.getImage()?.zoom ?? 1.0
        } set: { newValue in
            if var updatedImage = self.wrappedValue.getImage() {
                updatedImage.zoom = newValue
                self.wrappedValue.setImage(updatedImage)
            }
        }
    }
    
    var asImageOffsetX: Binding<Double> {
        Binding<Double>{
            self.wrappedValue.getImage()?.offsetX ?? 0.0
        } set: { newValue in
            if var updatedImage = self.wrappedValue.getImage() {
                updatedImage.offsetX = newValue
                self.wrappedValue.setImage(updatedImage)
            }
        }
    }

    var asZoom: Binding<Double> {
        Binding<Double>{
            self.wrappedValue.getImage()?.zoom ?? 0.0
        } set: { newValue in
            if var updatedImage = self.wrappedValue.getImage() {
                updatedImage.zoom = newValue
                self.wrappedValue.setImage(updatedImage)
            }
        }
    }
    
    var asCKColor: Binding<CKColor> {
        Binding<CKColor>(
            get: {
                self.wrappedValue.getColor() ?? CKColor(red: 0, green: 0, blue: 0, opacity: 0)
            },
            set: { newItem in
                self.wrappedValue.setColor(newItem)
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
                
                Task(priority: .userInitiated) {
                    guard let data = try? await newItem.loadTransferable(type: Data.self) else { return }
                    
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
                    
                    await MainActor.run {
                        self.wrappedValue.setImage(newImage)
                        if let detectedColor {
                            self.wrappedValue.setColor(detectedColor)
                        }
                    }
                }
            }
        )
    }
    #endif
}
