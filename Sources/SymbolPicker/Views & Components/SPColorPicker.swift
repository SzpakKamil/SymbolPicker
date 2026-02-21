//
//  SPColorPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 14/02/2026.
//

import SwiftUI
import ColorKit

public struct SPColorPicker: SPComponent {
    @Environment(\.spSpacing) var spSpacing
    public enum Direction: Int{
        case grid, row
    }
    
    // MARK: - Style Struct
    struct Configuration{
        var colors: [CKColor] = [
            .red, .orange, .yellow, .green,
            .mint, .teal, .blue, .indigo,
            .purple, .pink, .brown
        ]
        var type: SPColorPicker.Direction
        var allowCustomColor: Bool = true
        var supportOpacity: Bool = false
        var spacing: CGFloat? = nil
        
        init(){
            #if os(tvOS) || os(macOS)
            self.type = .row
            #else
            self.type = .grid
            #endif
        }
    }
    
    // MARK: - Stored Properties
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.spSelection) var spSelection
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var style = Configuration()
    var currentSize: CGFloat{
        return SPSpacing.getSize(in: dynamicTypeSize, for: spSpacing.colorPicker)
    }
    
    var selectedColor: CKColor{
        spSelection.wrappedValue.getColor()  ?? CKColor(red: 0, green: 0, blue: 0, opacity: 0)
    }
    
    var selectedColorBinding: Binding<CKColor>{
        return Binding {
            spSelection.wrappedValue.getColor() ?? CKColor(red: 0, green: 0, blue: 0, opacity: 0)
        } set: { newValue in
            spSelection.wrappedValue.setColor(newValue)
        }
    }
    
    public var body: some View {
        colorContainer{
            ForEach(style.colors){
                colorView(for: $0)
            }
            #if !os(tvOS) && !os(watchOS)
            if style.allowCustomColor{
                customColorView()
            }
            #endif
        }
    }
    
    // MARK: - Color Dot
    @ViewBuilder
    private func colorView(for color: CKColor) -> some View{
        #if os(tvOS)
        ColorCell(color: color, size: currentSize, isSelected: selectedColor == color) {
            selectedColorBinding.wrappedValue = color
        }
        #else
        let isSelected = selectedColor == color
        Button{
            selectedColorBinding.wrappedValue = color
        }label:{
            #if os(macOS)
            colorDotView(isSelected: isSelected, color: color)
            #else
            if #available(iOS 26.0, visionOS 26.0, tvOS 26.0, watchOS 26.0, *){
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(gradientFill(for: color), .tint)
                    .fontWeight(.light)
                    #if !os(visionOS)
                    .glassEffect(.clear.interactive())
                    #endif
                    .padding(isSelected ? 0 : 6)
            }else{
                colorDotView(isSelected: isSelected, color: color)
            }
            #endif
        }
        .buttonStyle(.plain)
        .accessibilityLabel(color.localizedDescription)
        .accessibilityAddTraits([.isButton])
        #endif
    }
    
    // MARK: - Custom Color Picker Dot
    #if !os(tvOS) && !os(watchOS)
    @ViewBuilder
    private func customColorView() -> some View{
        let isSelected = !style.colors.contains(selectedColor)
        ZStack{
            #if os(macOS)
            VStack(spacing: 0){
                if isSelected{
                    colorDotView(color: selectedColor)
                }else{
                    Image(.paintbrushCircleFill)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(
                            AngularGradient(
                                colors: [.red, .orange, .yellow, .green, .blue, .purple, .pink, .red],
                                center: .center
                            )
                        )
                        .animation(.smooth, value: selectedColor)
                        .overlay{
                            Circle()
                                .strokeBorder(Color.black.opacity(0.03), lineWidth: 1.5)
                        }
                }
            }
            .if{ content in
                if #available(macOS 26, *){
                    content
                        .glassEffect(.regular.interactive())
                        .contentTransition(.symbolEffect(.replace))
                }else{
                    content
                }
            }
            #else
            if #available(iOS 26.0, visionOS 26.0, watchOS 26.0, tvOS 26.0, *){
                ZStack{
                    Image(systemName: "largecircle.fill.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(gradientFill(for: selectedColor), AngularGradient(
                            colors: [.yellow, .red, .purple, .blue, .green, .yellow],
                            center: .center,
                            startAngle: .degrees(-90),
                            endAngle: .degrees(270)
                        ))
                        .fontWeight(.light)
                        #if !os(visionOS)
                        .glassEffect(.clear.interactive(), in: .circle)
                        #endif
                        .animation(.smooth, value: selectedColor)
                }
            }else{
                ZStack {
                    Circle()
                        .fill(gradientFill(for: selectedColor))
                        .padding(8)
                    
                    Circle()
                        .stroke(
                            AngularGradient(
                                colors: [.yellow, .red, .purple, .blue, .green, .yellow],
                                center: .center,
                                startAngle: .degrees(-90),
                                endAngle: .degrees(270)
                            ),
                            lineWidth: 8
                        )
                }
            }
            #endif
        }
        .overlay {
            ColorPicker(selection: selectedColorBinding.asColor, supportsOpacity: style.supportOpacity) {}
                .scaleEffect(currentSize * 0.1)
                .offset(x: currentSize * -1.0)
                .opacity(0.05)
                .contentShape(Rectangle())
        }
        .clipShape(Circle())
        .contentShape(Circle())
    }
    #endif

    
    // MARK: - Helper View Methods
    
    private func colorDotView(isSelected: Bool = true, color: CKColor) -> some View{
        #if os(macOS)
        Image(systemName: isSelected ? "checkmark.circle.fill" : "circle.fill")
            .resizable()
            .scaledToFit()
            .foregroundStyle(gradientFill(for: color))
            .overlay{
                Circle()
                    .strokeBorder(Color.black.opacity(0.03), lineWidth: 1.5)
            }
            .if{ content in
                if #available(iOS 17.0, macOS 14.0, *){ content.contentTransition(.symbolEffect(.replace)) }else{ content }
            }
        #else
        ZStack{
            Circle()
                .fill(gradientFill(for: color))
                .padding(currentSize * 0.12)
            if isSelected{
                Circle()
                    .stroke(Color.accentColor, style: StrokeStyle(lineWidth: currentSize * 0.07))
            }
        }
        #endif
    }
    
    private func gradientFill(for color: CKColor) -> LinearGradient{
        let startPoint: UnitPoint = colorScheme == .dark ? .bottom : .top
        let endPoint: UnitPoint = colorScheme == .dark ? .top : .bottom
        return LinearGradient(colors: [color.color.opacity(0.8), color.color], startPoint: startPoint, endPoint: endPoint)
    }
    
    @ViewBuilder
    private func colorContainer<V: View>(@ViewBuilder content: @escaping () -> V) -> some View {
        let baseLayout = Group {
            switch style.type {
            case .grid:
                LazyVGrid(columns: [.init(.adaptive(minimum: currentSize, maximum: currentSize * 1.1))], spacing: style.spacing ?? currentSize * 0.4) {
                    content()
                }
            case .row:
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: style.spacing ?? currentSize * 0.4) {
                        #if os(tvOS)
                        content()
                        #else
                        content()
                            .frame(width: currentSize, height: currentSize)
                        #endif
                    }
                    .if{ content in
                        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, *){ content.scrollTargetLayout() }else{ content }
                    }
                }
                .if{ content in
                    if #available(iOS 17.0, macOS 14.0, tvOS 17.0, *){ content.scrollTargetBehavior(.viewAligned).scrollClipDisabled() }else{ content }
                }
                .frame(height: currentSize * 1.5)
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
// MARK: - tvOS Specific Components

fileprivate struct ColorCell: View {
    @Environment(\.colorScheme) var colorScheme
    @FocusState private var isFocused: Bool
    
    let color: CKColor
    let size: CGFloat
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Circle()
                .fill(gradientFill(for: color))
        }
        .focused($isFocused)
        .buttonStyle(SPColorPickerButtonStyle(isSelected: isSelected, isFocused: isFocused, size: size))
        .accessibilityLabel(color.localizedDescription)
        .accessibilityAddTraits([.isButton])
    }
    
    private func gradientFill(for color: CKColor) -> LinearGradient{
        let startPoint: UnitPoint = colorScheme == .dark ? .bottom : .top
        let endPoint: UnitPoint = colorScheme == .dark ? .top : .bottom
        return LinearGradient(colors: [color.color.opacity(0.8), color.color], startPoint: startPoint, endPoint: endPoint)
    }
}

