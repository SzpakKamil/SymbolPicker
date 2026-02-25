//
//  SymbolPicker-Modifier.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public extension View {
    func symbolPicker<C: SPSymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection>,
        configuration: C
    ) -> SymbolPickerConfigurationWrapper<C, Self> {
        return SymbolPickerConfigurationWrapper(isPresented: isPresented, selection: selection, configuration: configuration) {
            self
        }
    }
    
    func symbolPicker(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection>
    ) -> SymbolPickerConfigurationWrapper<SPSymbolPickerDefaultConfiguration, Self> {
        return SymbolPickerConfigurationWrapper(isPresented: isPresented, selection: selection, configuration: SPSymbolPickerDefaultConfiguration()) {
            self
        }
    }

    func symbolPicker<C: SPSymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection?>,
        configuration: C
    ) -> SymbolPickerConfigurationWrapper<C, Self> {
        let binding = Binding {
            selection.wrappedValue ?? .color(value: CKColor(hexString: "#0000"))
        } set: { newValue in
            selection.wrappedValue = newValue
        }
        return SymbolPickerConfigurationWrapper(isPresented: isPresented, selection: binding, configuration: configuration) {
            self
        }
    }
    
    func symbolPicker(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection?>
    ) -> SymbolPickerConfigurationWrapper<SPSymbolPickerDefaultConfiguration, Self> {
        let binding = Binding {
            selection.wrappedValue ?? .color(value: CKColor(hexString: "#0000"))
        } set: { newValue in
            selection.wrappedValue = newValue
        }
        return SymbolPickerConfigurationWrapper(isPresented: isPresented, selection: binding, configuration: SPSymbolPickerDefaultConfiguration()) {
            self
        }
    }
}

public extension SymbolPicker where C == SPSymbolPickerDefaultConfiguration{
    func spColorSelectionEnabled(_ value: Bool) -> Self{
        var copy = self
        copy.style.allowColorSelection = value
        return copy
    }
    func spSymbolVariant(_ variant: SPSymbol.Variant) -> Self{
        var copy = self
        copy.style.symbolVariant = variant
        return copy
    }
    func spPageTypes(_ types: SPPageType..., defaultType: SPPageType? = nil) -> Self{
        var copy = self
        copy.pageType = defaultType ?? types.first ?? .symbol
        copy.style.supportedTypes = types
        copy.style.defaultType = defaultType ?? types.first ?? .symbol
        return copy
    }
    func spPageTypes(_ types: [SPPageType], defaultType: SPPageType? = nil) -> Self{
        var copy = self
        copy.pageType = defaultType ?? types.first ?? .symbol
        copy.style.supportedTypes = types
        copy.style.defaultType = defaultType ?? types.first ?? .symbol
        return copy
    }
    
    func spDisplayType(_ type: SPDisplayType) -> Self{
        var copy = self
        copy.style.displayType = type
        return copy
    }
    
    func spInsetedViews(overwriteDefault: Bool = false, @SPInsetedViewBuilder views: () -> [SPInsetedView]) -> Self{
        var copy = self
        if overwriteDefault{
            copy.style.customInsetedViews = views()
        }else{
            if copy.style.customInsetedViews.isEmpty{
                copy.style.customInsetedViews = copy.style.insetViews()
            }
            copy.style.customInsetedViews.append(contentsOf: views())
        }

        return copy
    }
}

public extension SymbolPickerConfigurationWrapper where C == SPSymbolPickerDefaultConfiguration{

    func spColorSelectionEnabled(_ value: Bool) -> Self{
        var copy = self
        copy.style.allowColorSelection = value
        return copy
    }
    func spSymbolVariant(_ variant: SPSymbol.Variant) -> Self{
        var copy = self
        copy.style.symbolVariant = variant
        return copy
    }
    func spPageTypes(_ types: SPPageType..., defaultType: SPPageType) -> Self{
        var copy = self
        copy.style.supportedTypes = types
        copy.style.defaultType = defaultType
        return copy
    }
    func spPageTypes(_ types: [SPPageType], defaultType: SPPageType) -> Self{
        var copy = self
        copy.style.supportedTypes = types
        copy.style.defaultType = defaultType
        return copy
    }

    func spInsetedViews(overwriteDefault: Bool = false, @SPInsetedViewBuilder views: () -> [SPInsetedView]) -> Self{
        var copy = self
        if overwriteDefault{
            copy.style.customInsetedViews = views()
        }else{
            if copy.style.customInsetedViews.isEmpty{
                copy.style.customInsetedViews = copy.style.insetViews()
            }
            copy.style.customInsetedViews.append(contentsOf: views())
        }

        return copy
    }

    func spPresentationType(_ mode: SPPresentationType ) -> Self{
        var copy = self
        copy.style.presentationType = mode
        return copy
    }
    
    func spDisplayType(_ type: SPDisplayType ) -> Self{
        var copy = self
        copy.style.displayType = type
        return copy
    }

    #if os(iOS)
    @available(iOS 16.0, *)
    func spDisplaySize(_ size: Set<SPDisplaySize>) -> Self{
        var copy = self
        copy.style.displaySize = size
        return copy
    }
    #endif
}



