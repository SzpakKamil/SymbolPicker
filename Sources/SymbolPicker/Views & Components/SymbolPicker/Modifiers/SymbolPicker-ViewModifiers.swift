//
//  SymbolPicker-ViewModifiers.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 16/03/2026.
//

import SwiftUI
import ColorKit


public extension View {
    func symbolPicker<DataAsset: SPDataAsset, Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection<DataAsset>>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<DataAsset, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(selection: selection, configuration: configuration)
        ) {
            self
        }
    }
    
    func symbolPicker<DataAsset: SPDataAsset, Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection<DataAsset>?>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<DataAsset, Configuration, Self> {
        let binding = Binding {
            selection.wrappedValue ?? .init(value: CKColor(hexString: "#0000"))
        } set: { newValue in
            selection.wrappedValue = newValue
        }
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(selection: binding, configuration: configuration)
        ) {
            self
        }
    }

    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        systemImage: Binding<String>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(systemImage: systemImage, configuration: configuration)
        ) {
            self
        }
    }
    
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        systemImage: Binding<String?>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(systemImage: systemImage, configuration: configuration)
        ) {
            self
        }
    }
    
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        systemImage: Binding<String>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(systemImage: systemImage, ckColor: ckColor, configuration: configuration)
        ) {
            self
        }
    }
    
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        systemImage: Binding<String?>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(systemImage: systemImage, ckColor: ckColor, configuration: configuration)
        ) {
            self
        }
    }
    
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        systemImage: Binding<String>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(systemImage: systemImage, color: color, configuration: configuration)
        ) {
            self
        }
    }
    
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        systemImage: Binding<String?>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(systemImage: systemImage, color: color, configuration: configuration)
        ) {
            self
        }
    }
    
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        systemImage: Binding<String>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(systemImage: systemImage, colorValues: colorValues, configuration: configuration)
        ) {
            self
        }
    }

    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        systemImage: Binding<String?>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(systemImage: systemImage, colorValues: colorValues, configuration: configuration)
        ) {
            self
        }
    }

    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        emoji: Binding<SPEmoji>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(emoji: emoji, configuration: configuration)
        ) {
            self
        }
    }

    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        emoji: Binding<SPEmoji?>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(emoji: emoji, configuration: configuration)
        ) {
            self
        }
    }

    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        emoji: Binding<SPEmoji>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(emoji: emoji, ckColor: ckColor, configuration: configuration)
        ) {
            self
        }
    }

    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        emoji: Binding<SPEmoji?>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(emoji: emoji, ckColor: ckColor, configuration: configuration)
        ) {
            self
        }
    }

    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        emoji: Binding<SPEmoji>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(emoji: emoji, color: color, configuration: configuration)
        ) {
            self
        }
    }

    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        emoji: Binding<SPEmoji?>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(emoji: emoji, color: color, configuration: configuration)
        ) {
            self
        }
    }

    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        emoji: Binding<SPEmoji>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(emoji: emoji, colorValues: colorValues, configuration: configuration)
        ) {
            self
        }
    }

    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        emoji: Binding<SPEmoji?>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(emoji: emoji, colorValues: colorValues, configuration: configuration)
        ) {
            self
        }
    }

    #if os(iOS) || os(macOS) || os(visionOS)
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        image: Binding<SPImage>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(image: image, configuration: configuration)
        ) {
            self
        }
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        image: Binding<SPImage?>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(image: image, configuration: configuration)
        ) {
            self
        }
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        image: Binding<SPImage>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(image: image, ckColor: ckColor, configuration: configuration)
        ) {
            self
        }
    }
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        image: Binding<SPImage?>,
        ckColor: Binding<CKColor>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(image: image, ckColor: ckColor, configuration: configuration)
        ) {
            self
        }
    }
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        image: Binding<SPImage>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(image: image, color: color, configuration: configuration)
        ) {
            self
        }
    }
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        image: Binding<SPImage?>,
        color: Binding<Color>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(image: image, color: color, configuration: configuration)
        ) {
            self
        }
    }
    
    
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        image: Binding<SPImage>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(image: image, colorValues: colorValues, configuration: configuration)
        ) {
            self
        }
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    func symbolPicker<Configuration: SymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        image: Binding<SPImage?>,
        colorValues: Binding<[Double]>,
        configuration: Configuration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerModifier<SPSymbol, Configuration, Self> {
        return SymbolPickerModifier(
            isPresented: isPresented,
            configuration: configuration,
            picker: SymbolPicker(image: image, colorValues: colorValues, configuration: configuration)
        ) {
            self
        }
    }
    #endif
}
