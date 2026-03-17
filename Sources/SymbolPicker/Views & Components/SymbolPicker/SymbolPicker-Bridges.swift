//
//  SymbolPicker-Bridges.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public struct SymbolPickerModifier<DataAsset: SPDataAsset, Configuration:SymbolPickerConfiguration, V: View>: View {
    let content: V
    let isPresented: Binding<Bool>
    var style: Configuration
    let picker: SymbolPicker<DataAsset, Configuration>
    
    public var body: some View {
        var configuredPicker = picker
        configuredPicker.setStyle(style)

        return content.modifier(SymbolPickerViewModifier(
            isPresented: isPresented,
            picker: configuredPicker,
            configuration: style
        ))
    }

    init(isPresented: Binding<Bool>, configuration: Configuration, picker: SymbolPicker<DataAsset, Configuration>,  @ViewBuilder content: () -> V, ) {
        self.content = content()
        self.isPresented = isPresented
        self.picker = picker
        self.style = configuration
    }
}



struct SymbolPickerViewModifier<DataAsset: SPDataAsset, Configuration: SymbolPickerConfiguration>: ViewModifier {
    @Binding private var isPresented: Bool
    var style: Configuration
    var picker: SymbolPicker<DataAsset, Configuration>
    
    var isDisplayedAsPopover: Bool{
        #if os(iOS)
        UIDevice.current.userInterfaceIdiom == .pad && [SPPresentationConfiguration.DisplayType.popover, .default].contains(style.presentation.presentationType)
        #else
        [SPPresentationConfiguration.DisplayType.popover, .default].contains(style.presentation.presentationType)
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
    func body(content: Content) -> some View {
        #if os(watchOS) || os(tvOS)
        content
            .sheet(isPresented: $isPresented) {
                presentationDentedView{ picker }
            }
        #else
        switch style.presentation.presentationType{
        case .default, .popover:
            content
                .popover(isPresented: $isPresented) {
                    presentationDentedView{ picker }
                    
                }
        case .sheet:
            content
                .sheet(isPresented: $isPresented) {
                    presentationDentedView{ picker }
                }
        case .fullScreenCover:
            content
            #if os(iOS)
                .fullScreenCover(isPresented: $isPresented) {
                    presentationDentedView{ picker }
                }
            #else
                .sheet(isPresented: $isPresented) {
                    presentationDentedView{ picker }
                }
            #endif
        }
        #endif
    }
    
    @ViewBuilder
    func presentationDentedView(@ViewBuilder content: @escaping () -> some View) -> some View{
        #if os(iOS) || os(visionOS)
        if #available(iOS 16, *){
            content()
            .if{ content in
                if #available(iOS 16.4, *){
                    content
                        .presentationContentInteraction(style.presentation.presentationContentInteraction.asPresentationContentInteraction())
                        .presentationBackground(style.presentation.presentationBackgroundColor)
                        .presentationBackgroundInteraction(style.presentation.presentationBackgroundInteraction.asPresentationBackgroundInteraction())
                        .presentationCornerRadius(style.presentation.presentationCornerRadius)
                        .presentationContentInteraction(.scrolls)
                }else{ content.background(style.presentation.presentationBackgroundColor) }
            }
            .presentationDragIndicator(style.presentation.presentationDragIndicator)
            .presentationDetents(Set(style.presentation.presentationDents.map{$0.asPresentationSize()}))
            .frame(width: width, height: height)
        }else{
            content()
                .background(style.presentation.presentationBackgroundColor)
                .frame(width: width, height: height)
        }
        #else
        content()
            .frame(width: width, height: height)
        #endif
    }
    
    init(isPresented: Binding<Bool>, picker: SymbolPicker<DataAsset, Configuration>, configuration: Configuration) {
        self._isPresented = isPresented
        self.picker = picker
        self.style = configuration
    }
}
