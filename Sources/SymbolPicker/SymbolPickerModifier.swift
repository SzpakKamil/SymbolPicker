//
//  SymbolModifier.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

@_documentation(visibility: internal)
public struct SymbolPickerModifier<Content: View>: View {
    let content: () -> Content
    @Binding var isPresented: Bool
    @Binding var symbolName: String
    @Binding var colorValue: SymbolColor
    private var dismissType: SymbolPickerDismissType = .manual
    private var symbolsStyle: SymbolPickerSymbolsStyle = .filled
    private var action: (() -> Void)? = nil
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    #if !os(macOS)
    var usePopover: Bool{
        if #available(iOS 17.0, *) {
            UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .vision
        } else {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    #endif

    public var body: some View {
        #if os(macOS)
        content()
            .popover(isPresented: $isPresented){
                SymbolPicker(isPresented: $isPresented, symbolName: $symbolName, color: $colorValue)
                    .symbolPickerDismiss(type: dismissType, action: action)
                    .symbolPickerSymbolsStyle(symbolsStyle)
            }
        #else
        if usePopover{
            content()
                .popover(isPresented: $isPresented){
                    SymbolPicker(isPresented: $isPresented, symbolName: $symbolName, color: $colorValue)
                        .symbolPickerDismiss(type: dismissType, action: action)
                        .symbolPickerSymbolsStyle(symbolsStyle)
                }
        }else{
            content()
                .sheet(isPresented: $isPresented){
                    SymbolPicker(isPresented: $isPresented, symbolName: $symbolName, color: $colorValue)
                        .symbolPickerDismiss(type: dismissType, action: action)
                        .symbolPickerSymbolsStyle(symbolsStyle)
                }
        }
        #endif
    }

    init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<[Double]>?, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self._isPresented = isPresented
        self._symbolName = symbolName
        self._colorValue = Binding {
            if let components = color?.wrappedValue {
                let red = components.count > 0 ? components[0] : 0
                let green = components.count > 1 ? components[1] : 0
                let blue = components.count > 2 ? components[2] : 0
                let alpha = components.count > 3 ? components[3] : 0
                return SymbolColor.customColor(red: red, green: green, blue: blue, alpha: alpha)
            } else {
                return SymbolColor.customColor(red: 0, green: 0, blue: 0, alpha: 1)
            }
        } set: { value in
            color?.wrappedValue = value.value
        }
    }
    init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>?, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self._isPresented = isPresented
        self._symbolName = symbolName
        self._colorValue = Binding {
            if let components = color?.wrappedValue.components, components.count >= 4 {
                return SymbolColor.customColor(red: components[0], green: components[1], blue: components[2], alpha: components[3])
            } else {
                return SymbolColor.customColor(red: 0, green: 0, blue: 0, alpha: 1)
            }
        } set: { value in
            color?.wrappedValue = value.color
        }
    }
    init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<SymbolColor>?, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self._isPresented = isPresented
        self._symbolName = symbolName
        self._colorValue = Binding {
            color?.wrappedValue ?? SymbolColor.customColor(red: 0, green: 0, blue: 0, alpha: 1)
        } set: { value in
            color?.wrappedValue = value
        }
    }
    
    init(isPresented: Binding<Bool>, symbolName: Binding<String>, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self._isPresented = isPresented
        self._symbolName = symbolName
        self._colorValue = .constant(SymbolColor.customColor(red: 0,green: 0,blue: 0,alpha: 0))
    }
}


public extension SymbolPickerModifier{
    func symbolPickerSymbolsStyle(_ style: SymbolPickerSymbolsStyle) -> Self {
        var copy = self
        copy.symbolsStyle = style
        return copy
    }
    func symbolPickerDismiss(type: SymbolPickerDismissType = .manual, action: (() -> Void)? = nil) -> Self {
        var copy = self
        copy.dismissType = type
        copy.action = action
        return copy
    }
}

public extension View {
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>) -> SymbolPickerModifier<Self>{
        SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, content: { self })
    }
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>?) -> SymbolPickerModifier<Self>{
        SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, color: color, content: { self })
    }
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<[Double]>?) -> SymbolPickerModifier<Self>{
        SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, color: color, content: { self })
    }
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<SymbolColor>?) -> SymbolPickerModifier<Self>{
        SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, color: color, content: { self })
    }
}
