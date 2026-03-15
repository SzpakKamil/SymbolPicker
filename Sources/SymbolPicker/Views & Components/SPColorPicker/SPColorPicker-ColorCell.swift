//
//  SPColorPicker-ColorCell.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

struct SPColorPickerColorCell: View {
    @Environment(\.colorScheme) var colorScheme
    @FocusState private var isFocused: Bool
    
    var color: CKColor
    var width: CGFloat
    var height: CGFloat
    var isSelected: Bool
    var rainbowOutline: Bool
    var action: () -> Void
    
    let rainbowGradient = AngularGradient(
        colors: [.yellow, .red, .purple, .blue, .green, .yellow],
        center: .center,
        startAngle: .degrees(-90),
        endAngle: .degrees(270)
    )
    
    var body: some View {
        #if os(tvOS)
        Button {
            action()
        } label: {
            Circle()
                .fill(spColorPickerGradientFill(for: color, in: colorScheme))
        }
        .focused($isFocused)
        .buttonStyle(SPColorPickerButtonStyle(isSelected: isSelected, isFocused: isFocused, width: width, height: height))
        .accessibilityLabel(color.localizedDescription)
        .accessibilityAddTraits([.isButton])
        #else
        let image: Image = {
            if rainbowOutline && !isSelected{
                return Image(.paintbrushCircleFill)
            }else{
                return Image(systemName: isSelected ? "checkmark.circle.fill" : "circle.fill")
            }
        }()
        
        let style: AnyShapeStyle = {
            if rainbowOutline{
                if isSelected{
                    AnyShapeStyle(spColorPickerGradientFill(for: color, in: colorScheme))
                }else{
                    AnyShapeStyle(rainbowGradient)
                }
            }else{
                AnyShapeStyle(spColorPickerGradientFill(for: color, in: colorScheme))
            }
        }()
        Button{
            action()
        }label:{
            #if os(macOS)
            image
            .resizable()
            .scaledToFit()
            .foregroundStyle(style)
            .overlay{
                Circle()
                    .strokeBorder(Color.black.opacity(0.03), lineWidth: 1.5)
            }
            .if{ content in
                if #available(iOS 17.0, macOS 14.0, *), !rainbowOutline { content.contentTransition(.symbolEffect(.replace)) }else{ content }
            }
            #else
            if #available(iOS 26.0, visionOS 26.0, tvOS 26.0, watchOS 26.0, *){
                Image(systemName: rainbowOutline || isSelected ? "largecircle.fill.circle" : "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(spColorPickerGradientFill(for: color, in: colorScheme), rainbowOutline ?  AnyShapeStyle(rainbowGradient) : AnyShapeStyle(.tint))
                    .fontWeight(.light)
                    #if !os(visionOS)
                    .glassEffect(.clear.interactive())
                    #endif
                    .padding(rainbowOutline || isSelected ? 0 : 6)
            }else{
                ZStack{
                    Circle()
                        .fill(spColorPickerGradientFill(for: color, in: colorScheme))
                        .padding(width * 0.12)
                    if isSelected || rainbowOutline{
                        Circle()
                            .stroke(
                                rainbowOutline ?  AnyShapeStyle(rainbowGradient) : AnyShapeStyle(.tint),
                                style: rainbowOutline ? StrokeStyle(lineWidth: width * 0.13) :  StrokeStyle(lineWidth: width * 0.07)
                            )
                    }
                }
                .frame(width: width, height: height)
            }
            #endif
        }
        .buttonStyle(.plain)
        .accessibilityLabel(color.localizedDescription)
        .accessibilityAddTraits([.isButton])
        #endif
    }
    
    init(color: CKColor, width: CGFloat, height: CGFloat, isSelected: Bool, rainbowOutline: Bool = false, action: @escaping () -> Void) {
        self.color = color
        self.width = width
        self.height = height
        self.isSelected = isSelected
        self.rainbowOutline = rainbowOutline
        self.action = action
    }
}
