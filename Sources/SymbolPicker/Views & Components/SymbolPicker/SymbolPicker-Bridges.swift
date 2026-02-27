//
//  SymbolPickerConfigurationWrapper.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 24/02/2026.
//

import SwiftUI

public struct SymbolPickerConfigurationWrapper<C:SPSymbolPickerConfiguration, V: View>: View {
    let content: V
    let isPresented: Binding<Bool>
    let selection: Binding<SPSelection>
    var style: C
    
    public var body: some View {
        content.modifier(SymbolPickerModifier(
            isPresented: isPresented,
            selection: selection,
            configuration: style
        ))
    }
    init(isPresented: Binding<Bool>, selection: Binding<SPSelection>, configuration: C, @ViewBuilder content: () -> V) {
        self.content = content()
        self.isPresented = isPresented
        self.selection = selection
        self.style = configuration
    }
}



struct SymbolPickerModifier<C: SPSymbolPickerConfiguration>: ViewModifier {
    @Binding private var isPresented: Bool
    @Binding private var selection: SPSelection
    var style: C
    
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
                presentationDentedView{ SymbolPicker(selection: $selection, configuration: style) }
            }
        #else
        switch style.presentation.presentationType{
        case .default, .popover:
            content
                .popover(isPresented: $isPresented) {
                    presentationDentedView{ SymbolPicker(selection: $selection, configuration: style) }
                    
                }
        case .sheet:
            content
                .sheet(isPresented: $isPresented) {
                    presentationDentedView{ SymbolPicker(selection: $selection, configuration: style) }
                }
        case .fullScreenCover:
            content
            #if os(iOS)
                .fullScreenCover(isPresented: $isPresented) {
                    presentationDentedView{ SymbolPicker(selection: $selection, configuration: style) }
                }
            #else
                .sheet(isPresented: $isPresented) {
                    presentationDentedView{ SymbolPicker(selection: $selection, configuration: style) }
                }
            #endif
        }
        #endif
    }
    
    @ViewBuilder
    func presentationDentedView(@ViewBuilder content: @escaping () -> some View) -> some View{
        #if os(iOS)
        if #available(iOS 16, *){
            content()
            #if os(iOS)
            .if{ content in
                if #available(iOS 16.4, *){
                    content
                        .presentationContentInteraction(style.presentation.presentationContentInteraction.asPresentationContentInteraction())
                        .presentationBackground(style.presentation.presentationBackgroundColor)
                        .presentationBackgroundInteraction(style.presentation.presentationBackgroundInteraction.asPresentationBackgroundInteraction())
                        .presentationCornerRadius(style.presentation.presentationCornerRadius)
                        .presentationContentInteraction(.scrolls)
                }else{ content }
                
            }
            #endif
            .presentationDragIndicator(style.presentation.presentationDragIndicator)
            .presentationDetents(Set(style.presentation.presentationDents.map{$0.asPresentationSize()}))
            .frame(width: width, height: height)
        }else{
            content()
                .frame(width: width, height: height)
        }
        #else
        content()
            .frame(width: width, height: height)
        #endif
    }
    
    init(isPresented: Binding<Bool>, selection: Binding<SPSelection>, configuration: C) {
        self._isPresented = isPresented
        self._selection = selection
        self.style = configuration
    }
}
