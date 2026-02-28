//
//  TransparentBlurView.swift
//  TransparentBlur
//
//  Created by Balaji on 21/06/23.
//

import SwiftUI

#if canImport(UIKit) && !os(watchOS)
@_documentation(visibility: internal)
struct TransparentBlurView: UIViewRepresentable {
    var removeAllFilters: Bool = false
    func makeUIView(context: Context) -> TransparentBlurViewHelper {
        return TransparentBlurViewHelper(removeAllFilters: removeAllFilters)
    }
    
    func updateUIView(_ uiView: TransparentBlurViewHelper, context: Context) {
        
    }
}

/// Disabling Trait Changes for Our Transparent Blur View
@_documentation(visibility: internal)
class TransparentBlurViewHelper: UIVisualEffectView {
    init(removeAllFilters: Bool) {
        #if os(tvOS)
        super.init(effect: UIBlurEffect(style: .prominent))
        #else
        super.init(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        #endif
        /// Removing Background View, if it's Available
        if subviews.indices.contains(1) {
            subviews[1].alpha = 0
        }
        
        if let backdropLayer = layer.sublayers?.first {
            if removeAllFilters {
                backdropLayer.filters = []
            } else {
                /// Removing All Expect Blur Filter
                backdropLayer.filters?.removeAll(where: { filter in
                    String(describing: filter) != "gaussianBlur"
                })
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Disabling Trait Changes
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }
}

#endif
@_documentation(visibility: internal)
struct Blur: View {
    @Environment(\.colorScheme) var colorScheme
    var radius: CGFloat
    var opaque: Bool
    
    init(radius: CGFloat = 5.0, opaque: Bool = true) {
        self.radius = radius
        self.opaque = opaque
    }
    
    var body: some View {
        ZStack{
            #if os(visionOS) || os(macOS)
            Rectangle()
                .fill(.bar)
                .padding(.bottom, -25)
                .mask {
                    VStack(spacing: 0) {
                        LinearGradient(
                            colors: [
                                Color.black.opacity(1),
                                Color.black.opacity(0),
                            ],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                        Rectangle()
                    }
                }
                .ignoresSafeArea()
            Rectangle()
                .fill(.bar)
                .padding(.bottom, -25)
                .mask {
                    VStack(spacing: 0) {
                        LinearGradient(
                            colors: [
                                Color.black.opacity(1),
                                Color.black.opacity(0),
                            ],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                        Rectangle()
                    }
                }
                .ignoresSafeArea()
            #elseif os(tvOS)
            if #unavailable(tvOS 26.0){
                Rectangle()
                    .if{ content in
                        if #available(tvOS 18.0, *){
                            content
                                .fill(.white.opacity(0.01))
                        }else{
                            content
                                .fill((colorScheme == .dark ? Color.black : .white).opacity(0.5))
                        }
                    }
                    
                    .mask {
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.black.opacity(1),
                                        Color.black.opacity(1),
                                        Color.black.opacity(0.75),
                                        Color.black.opacity(0),
                                    ],
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                            )
                    }
                    .ignoresSafeArea()
            }
            Rectangle()
                .if{content in
                    if #available(tvOS 26.0, *){
                        content
                            .fill(.ultraThinMaterial)
                    }else{
                        content
                            .fill(.ultraThinMaterial)
                    }
                }
                
                .mask {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.black.opacity(1),
                                    Color.black.opacity(0.9),
                                    Color.black.opacity(0.75),
                                    Color.black.opacity(0),
                                ],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                }
                .ignoresSafeArea()
            Rectangle()
                .if{content in
                    if #available(tvOS 26.0, *){
                        content
                            .fill(.ultraThinMaterial)
                    }else{
                        content
                            .fill(.ultraThinMaterial)
                    }
                }
                .mask {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.black.opacity(1),
                                    Color.black.opacity(0.9),
                                    Color.black.opacity(0.75),
                                    Color.black.opacity(0),
                                ],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                }
                .ignoresSafeArea()
            #elseif canImport(UIKit) && !os(watchOS)
            TransparentBlurView(removeAllFilters: true)
                .blur(radius: 4, opaque: false)
                .padding(.bottom, -25)
                .mask {
                    VStack(spacing: 0) {
                        LinearGradient(
                            colors: [
                                Color.black.opacity(1),
                                Color.black.opacity(1),
                                Color.black.opacity(0),
                            ],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                        Rectangle()
                    }
                }
                .ignoresSafeArea()
            #endif
        }
    }
}
