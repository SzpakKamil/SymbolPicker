//
//  SPSelectedSymbol.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 12/04/2025.
//

import SwiftUI
import ColorKit

@_documentation(visibility: internal)
struct SPSelectedSymbol: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.symbolPickerStyle) var symbolPickerStyle
    @Environment(\.spSelection) var spSelection
    @Environment(\.spCalculateScale) var spCalculateScale
    @Environment(\.spCalculateOffset) var spCalculateOffset
    @Environment(\.colorScheme) var colorScheme
    
    var size: CGFloat {
        SPSpacing.getSize(in: dynamicTypeSize, for: symbolPickerStyle.spacing.selectedSymbol)
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
        #if os(watchOS)
        Button{
            
        }label:{
            spSelection.wrappedValue.asView()
                .if{ content in
                    let size = size
                    let padding = isImage ? 0 : size * 0.3
                    let targetSize = (isImage ? size * 1.7 : size) * 0.8
                    content
                        .frame(width: targetSize, height: targetSize)
                        .padding(padding)
                        .foregroundStyle((colorValue?.luminance ?? 0) > 0.6 ? .black : .white)
                        .background(isImage ? Color.clear : (colorValue?.color ?? .clear))
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
                        .foregroundStyle((colorValue?.luminance ?? 0) > 0.6 ? .black : .white)
                        .background(Group {
                            if !isImage {
                                LinearGradient(
                                    colors: [(colorValue?.color ?? .clear), (colorValue?.color ?? .clear).opacity(0.9)],
                                    startPoint: colorScheme == .dark ? .topLeading : .bottomTrailing,
                                    endPoint: colorScheme == .dark ? .bottomTrailing : .topLeading)
                            }else{
                                spSelection.wrappedValue.asView()
                            }
                        })
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: targetSize * 0.5, style: .continuous))
                        .shadow(color: (colorValue?.color ?? .black).opacity(0.5), radius: 20)
                        .scaleEffect(spCalculateScale)
#if os(watchOS)
                        .offset(y: spCalculateOffset)
#else
                        .offset(y: spCalculateOffset)
#endif
                } else {
                    let size = size
                    let padding = isImage ? 0 : size * 0.2
                    let targetSize = (isImage ? size * 1.7 : size) * 0.8
                    content
                        .frame(width: targetSize, height: targetSize)
                        .padding(padding)
                        .foregroundStyle((colorValue?.luminance ?? 0) > 0.6 ? .black : .white)
                        .background(isImage ? Color.clear : (colorValue?.color ?? .clear))
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
        .padding(.top, spCalculateScale != 1 ? 3 : -5)
        .padding(.bottom, 5)
        .animation(.smooth, value: spCalculateScale)
        #endif
        #endif

    }
}
