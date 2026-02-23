//
//  SymbolPicker-Modifier.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public extension View {
    // 1. Capture the configuration in a wrapper to allow chaining
    func symbolPicker(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection>,
        style: SymbolPicker.Configuration = .init()
    ) -> SymbolPickerConfigurationWrapper<Self> {
        return SymbolPickerConfigurationWrapper(
            isPresented: isPresented,
            selection: selection,
            style: style
        ){
            self
        }
    }
    func symbolPicker(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection?>,
        style: SymbolPicker.Configuration = .init()
    ) -> SymbolPickerConfigurationWrapper<Self> {
        let binding = Binding{
            selection.wrappedValue ?? .color(value: CKColor(hexString: "#0000"))
        }set: { newValue in
            selection.wrappedValue = newValue
        }
        return SymbolPickerConfigurationWrapper(
            isPresented: isPresented,
            selection: binding,
            style: style
        ){
            self
        }
    }
}

public struct SymbolPickerConfigurationWrapper<V: View>: View {
    let content: V
    let isPresented: Binding<Bool>
    let selection: Binding<SPSelection>
    var style: SymbolPicker.Configuration
    
    public var body: some View {
        content.modifier(SymbolPickerModifier(
            isPresented: isPresented,
            selection: selection,
            configuration: style
        ))
    }
    init(isPresented: Binding<Bool>, selection: Binding<SPSelection>, style: SymbolPicker.Configuration, @ViewBuilder content: () -> V) {
        self.content = content()
        self.isPresented = isPresented
        self.selection = selection
        self.style = style
    }
    
}

public extension SymbolPicker{
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
}

public extension SymbolPickerConfigurationWrapper{
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
    
    func spDisplayType(_ mode: SPDisplayType ) -> Self{
        var copy = self
        copy.style.displayType = mode
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



struct SymbolPickerModifier: ViewModifier {
    @Binding private var isPresented: Bool
    @Binding private var selection: SPSelection
    
    var isDisplayedAsPopover: Bool{
        #if os(iOS)
        UIDevice.current.userInterfaceIdiom == .pad && [SPDisplayType.popover, .default].contains(configuration.displayType)
        #else
        [SPDisplayType.popover, .default].contains(configuration.displayType)
        #endif
    }
    
    var width: CGFloat?{
        #if os(macOS)
        return isDisplayedAsPopover ? 310 : nil
        #elseif os(iOS)
        return isDisplayedAsPopover ? 370 : nil
        #elseif os(visionOS)
        return isDisplayedAsPopover ? 370 : nil
        #elseif os(tvOS)
        if #available(tvOS 26.0, *){
            800
        }else{
            nil
        }
        #else
        return nil
        #endif
    }
    
    var height: CGFloat?{
        #if os(macOS)
        return isDisplayedAsPopover ? 430: nil
        #elseif os(iOS)
        return isDisplayedAsPopover ? 470 : nil
        #elseif os(visionOS)
        return isDisplayedAsPopover ? 460 : nil
        #elseif os(tvOS)
        if #available(tvOS 26.0, *){
            900
        }else{
            nil
        }
        #else
        return nil
        #endif
    }
    var configuration = SymbolPicker.Configuration()
    func body(content: Content) -> some View {
        #if os(watchOS) || os(tvOS)
        content
            .sheet(isPresented: $isPresented) {
                presentationDentedView{ SymbolPicker(selection: $selection, configuration: configuration) }
            }
        #else
        switch configuration.displayType{
        case .default, .popover:
            content
                .popover(isPresented: $isPresented) {
                    presentationDentedView{ SymbolPicker(selection: $selection, configuration: configuration) }
                    
                }
        case .sheet:
            content
                .sheet(isPresented: $isPresented) {
                    presentationDentedView{ SymbolPicker(selection: $selection, configuration: configuration) }
                }
        }
        #endif
    }
    
    @ViewBuilder
    func presentationDentedView(@ViewBuilder content: () -> some View) -> some View{
        #if os(iOS)
        if #available(iOS 16.0, *){
            content()
                .frame(width: width, height: height)
                .presentationDragIndicator(.visible)
                .presentationDetents(Set(configuration.displaySize.map{$0.asPresentationSize()}))
        }else{
            content()
                .frame(width: width, height: height)
        }
        #else
        content()
            .frame(width: width, height: height)
        #endif
    }
    
    init(isPresented: Binding<Bool>, selection: Binding<SPSelection>, configuration: SymbolPicker.Configuration? = nil) {
        self._isPresented = isPresented
        self._selection = selection
        self.configuration = configuration ?? .init()
    }
}
