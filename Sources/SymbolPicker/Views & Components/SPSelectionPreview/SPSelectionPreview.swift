//
//  SPSelectionPreview.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public struct SPSelectionPreview: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.symbolPickerStyle) var symbolPickerStyle
    @Environment(\.spSelection) var spSelection
    @Environment(\.spPreviewCalculateScale) var spPreviewCalculateScale
    @Environment(\.spPreviewCalculateOffset) var spPreviewCalculateOffset
    @Environment(\.colorScheme) var colorScheme
    @FocusState var isFocused: Bool
    var size: CGFloat {
        symbolPickerStyle.spacings.getValue(.width, for: .previewSelection, at: dynamicTypeSize)
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
    
    public var body: some View {
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
                            .foregroundStyle(symbolPickerStyle.colorPicker == nil || colorValue?.rgbComponents().a == 0 || colorValue == nil ? (colorScheme == .dark ? .black : .white) : ((colorValue?.luminance ?? 0) > 0.6 ? .black : .white))
                            .background(Group {
                                if !isImage {
                                    if symbolPickerStyle.colorPicker == nil || colorValue?.rgbComponents().a == 0 || colorValue == nil{
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
                            #if compiler(>=6.2)
                            .if{ content in
                                if #available(watchOS 26.0, *){
                                    content
                                        .glassEffect()
                                }else{
                                    content
                                }
                            }
                            #endif
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
                            .foregroundStyle(symbolPickerStyle.colorPicker == nil || colorValue?.rgbComponents().a == 0 || colorValue == nil ? (colorScheme == .dark ? .black : .white) : ((colorValue?.luminance ?? 0) > 0.6 ? .black : .white))
                            .background(Group {
                                if !isImage {
                                    if symbolPickerStyle.colorPicker == nil || colorValue?.rgbComponents().a == 0 || colorValue == nil{
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
                            .clipShape(RoundedRectangle(cornerRadius: targetSize * symbolPickerStyle.selectionPreview.selectionPreviewCornerRadiusFactor, style: .continuous))
                            .shadow(color: (colorValue?.color ?? .black).opacity(0.5), radius: 20)
                            .scaleEffect(spPreviewCalculateScale)
                            #if os(watchOS)
                            .offset(y: spPreviewCalculateOffset)
                            #else
                            .offset(y: spPreviewCalculateOffset)
                            #endif
                    } else {
                        let size = size
                        let padding = size * 0.2
                        let targetSize = size * 0.8
                        content
                            .frame(width: targetSize, height: targetSize)
                            .padding(padding)
                            .foregroundStyle(symbolPickerStyle.colorPicker == nil || colorValue?.rgbComponents().a == 0 || colorValue == nil ? (colorScheme == .dark ? .black : .white) : ((colorValue?.luminance ?? 0) > 0.6 ? .black : .white))
                            .background(Group {
                                if !isImage {
                                    if symbolPickerStyle.colorPicker == nil || colorValue?.rgbComponents().a == 0 || colorValue == nil{
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
                            .clipShape(RoundedRectangle(cornerRadius: targetSize * symbolPickerStyle.selectionPreview.selectionPreviewCornerRadiusFactor, style: .continuous))
                        #if os(macOS)
                            .shadow(color: (colorValue?.color ?? .black).opacity(0.5), radius: 20)
                        #endif
                    }
                }
                Spacer()
            }
            #if os(tvOS)
            .if{ content in
                if #available(tvOS 15.0, *){
                    content
                        .focusable()
                        .focused($isFocused)
                        .scaleEffect(isFocused ? 1.1 : 1.0)
                        .animation(.smooth, value: isFocused)
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
            #elseif os(tvOS)
            .padding(.vertical, 5)
            #else
            .padding(.top, spPreviewCalculateScale != 1 ? 3 : -8)
            .padding(.bottom, 8)
            .animation(.smooth, value: spPreviewCalculateScale)
            #endif
            #if !os(tvOS)
            .allowsHitTesting(false)
            #endif
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
    
    public init(){}
}
