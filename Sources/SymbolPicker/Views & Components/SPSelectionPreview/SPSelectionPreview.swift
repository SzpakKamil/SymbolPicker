//
//  SPSelectionPreview.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

@_documentation(visibility: internal)
struct SPSelectionPreview: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.symbolPickerStyle) var symbolPickerStyle
    @Environment(\.spSelection) var spSelection
    @Environment(\.spPreviewCalculateScale) var spPreviewCalculateScale
    @Environment(\.spPreviewCalculateOffset) var spPreviewCalculateOffset
    @Environment(\.colorScheme) var colorScheme
    
    var size: CGFloat {
        symbolPickerStyle.spacingConfiguration().getValue(.width, for: .previewSelection, at: dynamicTypeSize)
    }
    
    var colorValue: CKColor? {
        spSelection.wrappedValue.getColor()
    }
    
    var isImage: Bool {
        if spSelection.wrappedValue.getImage() != nil {
            return true
        }
        return false
    }
    
    var body: some View {
        if spSelection.wrappedValue.isContentAvailable(){
#if os(watchOS)
            Button{
                
            }label:{
                spSelection.wrappedValue.asView()
                    .if{ content in
                        let size = size
                        let padding = size * 0.35
                        let targetSize = size
                        content
                            .frame(width: targetSize, height: targetSize)
                            .padding(padding)
                            .foregroundStyle(symbolPickerStyle.colorPicker == nil || colorValue?.rgbComponents().a == 0 ? (colorScheme == .dark ? .black : .white) : ((colorValue?.luminance ?? 0) > 0.6 ? .black : .white))
                            .background(Group {
                                if !isImage {
                                    if symbolPickerStyle.colorPicker == nil || colorValue?.rgbComponents().a == 0{
                                        colorScheme == .dark ? Color.white : Color.black
                                    }else{
                                        LinearGradient(
                                            colors: [(colorValue?.color ?? .clear), (colorValue?.color ?? .clear).opacity(0.9)],
                                            startPoint: colorScheme == .dark ? .topLeading : .bottomTrailing,
                                            endPoint: colorScheme == .dark ? .bottomTrailing : .topLeading)
                                    }
                                }else{
                                    spSelection.wrappedValue.asView()
                                }
                            })
                            .clipShape(.circle)
                            .if{ content in
                                if #available(watchOS 26.0, *){
                                    content
                                        .glassEffect()
                                }else{
                                    content
                                }
                            }
                    }
            }
            .buttonStyle(.plain)
            .allowsHitTesting(false)
#else
            HStack {
                Spacer()
                Group{
                    if isImage{
                        Rectangle().fill(.clear)
                    }else{
                        spSelection.wrappedValue.asView()
                    }
                }
                .if { content in
                    if #available(iOS 26.0, visionOS 26.0, macOS 26.0, tvOS 26.0, *) {
                        let size = size
                        let padding = size * 0.35
                        let targetSize = size
                        content
                            .frame(width: targetSize, height: targetSize)
                            .padding(padding)
                            .foregroundStyle(symbolPickerStyle.colorPicker == nil || colorValue?.rgbComponents().a == 0 ? (colorScheme == .dark ? .black : .white) : ((colorValue?.luminance ?? 0) > 0.6 ? .black : .white))
                            .background(Group {
                                if !isImage {
                                    if symbolPickerStyle.colorPicker == nil || colorValue?.rgbComponents().a == 0{
                                        colorScheme == .dark ? Color.white : Color.black
                                    }else{
                                        LinearGradient(
                                            colors: [(colorValue?.color ?? .clear), (colorValue?.color ?? .clear).opacity(0.9)],
                                            startPoint: colorScheme == .dark ? .topLeading : .bottomTrailing,
                                            endPoint: colorScheme == .dark ? .bottomTrailing : .topLeading)
                                    }
                                }else{
                                    spSelection.wrappedValue.asView()
                                }
                            })
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: targetSize * 0.5, style: .continuous))
                            .shadow(color: (colorValue?.color ?? .black).opacity(0.5), radius: 20)
                            .scaleEffect(spPreviewCalculateScale)
#if os(watchOS)
                        .offset(y: spPreviewCalculateOffset)
#else
                        .offset(y: spPreviewCalculateOffset)
#endif
                    } else {
                        let size = size
                        let padding = isImage ? 0 : size * 0.2
                        let targetSize = (isImage ? size * 1.7 : size) * 0.8
                        content
                            .frame(width: targetSize, height: targetSize)
                            .padding(padding)
                            .foregroundStyle(symbolPickerStyle.colorPicker == nil || colorValue?.rgbComponents().a == 0 ? (colorScheme == .dark ? .black : .white) : ((colorValue?.luminance ?? 0) > 0.6 ? .black : .white))
                            .background(Group {
                                if !isImage {
                                    if symbolPickerStyle.colorPicker == nil || colorValue?.rgbComponents().a == 0{
                                        colorScheme == .dark ? Color.white : Color.black
                                    }else{
                                        LinearGradient(
                                            colors: [(colorValue?.color ?? .clear), (colorValue?.color ?? .clear).opacity(0.9)],
                                            startPoint: colorScheme == .dark ? .topLeading : .bottomTrailing,
                                            endPoint: colorScheme == .dark ? .bottomTrailing : .topLeading)
                                    }
                                }else{
                                    spSelection.wrappedValue.asView()
                                }
                            })
                            .clipShape(RoundedRectangle(cornerRadius: targetSize * 0.3, style: .continuous))
                    }
                }
                Spacer()
            }
#if os(tvOS)
            .if{ content in
                if #available(tvOS 17.0, *){
                    content.focusable()
                }else{
                    content
                }
            }
#endif
#if os(iOS) || os(visionOS)
            .if {content in
                if #available(iOS 26.0, visionOS 26.0, *) {
                    content
                        .padding(.top, 20)
                }else{
                    content
                        .padding(.vertical, 10)
                }
            }
            .ignoresSafeArea()
#else
            .padding(.top, spPreviewCalculateScale != 1 ? 3 : -5)
            .padding(.bottom, 5)
            .animation(.smooth, value: spPreviewCalculateScale)
#endif
            .allowsHitTesting(false)
#endif
        }
    }
    
    func asInsetView() -> SPInsetedView {
        #if os(watchOS)
        return SPInsetedView(placement: .toolbarBottomTralling) {
            self
        }
        .spIsDisplayed { $0.spSelection.wrappedValue.isContentAvailable() }
        #elseif os(macOS)
        return SPInsetedView(placement: .safeAreaTop) {
            self
        }
        .spIsDisplayed { $0.spSelection.wrappedValue.isContentAvailable() }
        #else
        if #available(iOS 26.0, visionOS 26.0, tvOS 26.0, *){
            return SPInsetedView(placement: .safeAreaTop) {
                self
            }
            .spIsDisplayed { $0.spSelection.wrappedValue.isContentAvailable() }
        }else{
            return SPInsetedView(placement: .scrollContentTop) {
                self
            }
            .spIsDisplayed { $0.spSelection.wrappedValue.isContentAvailable() }
        }
        #endif
    }
}
