//
//  SPOptionList-ScrollView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

struct SPOptionListScrollView<V: View>: View {
    @Environment(\.spPageType) var spPageType
    @Environment(\.symbolPickerStyle) var style
    let useScrollView: Bool // New Parameter
    let content: (ScrollViewProxy?) -> V // Made proxy optional since it won't exist if not scrolling

    var verticalEdges: Edge.Set {
        switch (style.topView?.inset, style.bottomView?.inset) {
        case (nil, nil): return .vertical
        case (nil, .safeArea), (.scrollContent, nil): return .top
        case (.safeArea, nil), (nil, .scrollContent): return .bottom
        default: return []
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Safe Area Fallback Top
            #if os(visionOS)
            if style.topView?.inset == .safeArea{
                renderInsetView(style.topView?.view, isTopEdge: true)
                    .padding(.top, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
            }
            #else
            if #unavailable(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0), style.topView?.inset == .safeArea {
                renderInsetView(style.topView?.view, isTopEdge: true)
            }
            #endif

            if useScrollView {
                ScrollViewReader { proxy in
                    ScrollView {
                        scrollBody(proxy: proxy)
                    }
                    #if os(tvOS)
                    .if { content in if #available(tvOS 17.0, *){ content.scrollClipDisabled() } } // Simplified for brevity
                    #endif
                    .onChange(of: spPageType.wrappedValue) { newValue in
                        withAnimation { proxy.scrollTo(newValue, anchor: .top) }
                    }
                    .onAppear { proxy.scrollTo(spPageType.wrappedValue, anchor: .top) }
                
                }
            } else {
                // Non-scrolling layout
                scrollBody(proxy: nil)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            // Safe Area Fallback Bottom
            #if os(visionOS)
            if style.topView?.inset == .safeArea{
                renderInsetView(style.bottomView?.view, isTopEdge: false)
                    .padding(.bottom, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
            }
            #else
            if #unavailable(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0), style.bottomView?.inset == .safeArea {
                renderInsetView(style.bottomView?.view, isTopEdge: false)
            }
            #endif
        }
        #if !os(visionOS)
        .if{ content in
            if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *){
                content
                    .safeAreaBar(edge: .top) {
                        if style.topView?.inset == .safeArea {
                            style.topView?.view
                                .safeAreaPadding(.vertical, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
                                .safeAreaPadding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList))
                        }
                    }
                    .safeAreaBar(edge: .bottom) {
                        if style.bottomView?.inset == .safeArea {
                            style.bottomView?.view
                                .safeAreaPadding(.vertical, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
                                .safeAreaPadding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList))
                        }
                    }
            }else{
                content
            }
        }
        #endif
    }

    @ViewBuilder
    private func scrollBody(proxy: ScrollViewProxy?) -> some View {
        if let proxy{
            LazyVStack {
                if style.topView?.inset == .scrollContent {
                    style.topView?.view
                }
                
                content(proxy)
                
                if style.bottomView?.inset == .scrollContent {
                    style.bottomView?.view
                }
            }
            .padding(verticalEdges, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
            .padding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList))
        }else{
            
            content(proxy)
        }

    }
    
    @ViewBuilder
    private func renderInsetView(_ view: AnyView?, isTopEdge: Bool) -> some View {
        view?
            .padding(isTopEdge ? .top : .bottom, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
            .padding(isTopEdge ? .bottom : .top, (SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0) * 0.5) 
            .environment(\.spHorizontalPadding, SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0)
    }

    init(useScrollView: Bool, @ViewBuilder content: @escaping (ScrollViewProxy?) -> V) {
        self.useScrollView = useScrollView
        self.content = content
    }
}
