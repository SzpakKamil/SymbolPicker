//
//  SPColorPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public struct SPColorPicker: View {
    @Environment(\.spHorizontalPadding) var spHorizontalPadding
    @Environment(\.symbolPickerStyle) var symbolPickerStyle
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.spSelection) var spSelection
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @State private var isPresentingColorPicker = false
    var currentWidth: CGFloat {
        symbolPickerStyle.spacingConfiguration().getValue(.width, for: .colorPicker, at: dynamicTypeSize)
    }
    var currentHeight: CGFloat {
        symbolPickerStyle.spacingConfiguration().getValue(.height, for: .colorPicker, at: dynamicTypeSize)
    }
    var selectedColor: CKColor{ spSelection.wrappedValue.getColor() ?? CKColor(red: 0, green: 0, blue: 0, opacity: 0) }
    
    public var body: some View {
        if let config = symbolPickerStyle.colorPicker {
            #if os(watchOS)
            Button("Color Picker", systemImage: "paintbrush.pointed.fill"){
                isPresentingColorPicker.toggle()
            }
            .sheet(isPresented: $isPresentingColorPicker) {
                colorContainer(config: config){
                    ForEach(config.colors){ color in
                        SPColorPickerColorCell(color: color, width: currentWidth, height: currentHeight, isSelected: selectedColor == color) {
                            spSelection.asCKColor.wrappedValue = color
                        }
                    }
                    #if !os(tvOS) && !os(watchOS)
                    if config.supportCustomColor{
                        SPColorPickerCustomColorCell(color: selectedColor, width: currentWidth, height: currentHeight, config: config)
                    }
                    #endif
                }
            }
            #else
            colorContainer(config: config){
                ForEach(config.colors){ color in
                    SPColorPickerColorCell(color: color, width: currentWidth, height: currentHeight, isSelected: selectedColor == color) {
                        spSelection.asCKColor.wrappedValue = color
                    }
                }
                #if !os(tvOS) && !os(watchOS)
                if config.supportCustomColor{
                    SPColorPickerCustomColorCell(color: selectedColor, width: currentWidth, height: currentHeight, config: config)
                }
                #endif
            }
            #endif
        }
    }
    
    @ViewBuilder
    private func colorContainer<V: View>(config: SPColorPickerConfiguration, @ViewBuilder content: @escaping () -> V) -> some View {
        let baseLayout = Group {
            switch config.type {
            case .grid:
                #if os(watchOS)
                ScrollView{
                    LazyVGrid(columns: [.init(.adaptive(minimum: currentWidth, maximum: currentWidth * 1.1))], spacing: config.spacing ?? currentWidth * 0.3) {
                        content()
                    }
                    .padding(.horizontal, spHorizontalPadding)
                }
                #else
                LazyVGrid(columns: [.init(.adaptive(minimum: currentWidth, maximum: currentWidth * 1.1))], spacing: config.spacing ?? currentWidth * 0.3) {
                    content()
                }
                .padding(.horizontal, spHorizontalPadding)
                #endif
            case .row:
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: config.spacing ?? currentWidth * 0.3) {
                        #if os(tvOS)
                        content()
                        #else
                        content()
                            .frame(width: currentWidth, height: currentHeight)
                        #endif
                    }
                    .padding(.horizontal, spHorizontalPadding)
                    .if{ content in if #available(iOS 17.0, macOS 14.0, tvOS 17.0, *){ content.scrollTargetLayout() }else{ content } }
                }
                .if{ content in if #available(iOS 17.0, macOS 14.0, tvOS 17.0, *){ content.scrollTargetBehavior(.viewAligned).scrollClipDisabled() }else{ content } }
                .frame(height: currentWidth * 1.1)
            }
        }

        #if os(visionOS) || os(watchOS)
        baseLayout
        #else
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, *) {
            GlassEffectContainer(spacing: 0) {
                baseLayout
            }
        } else {
            baseLayout
        }
        #endif
    }
    
    // MARK: - Init
    public init() {}
}
