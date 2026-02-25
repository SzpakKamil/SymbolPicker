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
        let topIsClear = style.getViews(for: .safeAreaTop).isEmpty &&
                         style.getViews(for: .scrollContentTop).isEmpty
        
        let bottomIsClear = style.getViews(for: .safeAreaBottom).isEmpty &&
                            style.getViews(for: .scrollContentBottom).isEmpty

        switch (topIsClear, bottomIsClear) {
        case (true, true):   return .vertical
        case (true, false):  return .top
        case (false, true):  return .bottom
        case (false, false): return []
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            if #unavailable(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0){
                renderInsetView(style.getViews(for: .safeAreaTop), isTopEdge: true)
            }

            if useScrollView {
                ScrollViewReader { proxy in
                    ScrollView {
                        scrollBody(proxy: proxy)
                    }
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

            if #unavailable(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0){
                renderInsetView(style.getViews(for: .safeAreaBottom), isTopEdge: true)
            }
        }
        .if{ content in
            if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *){
                content
                    .safeAreaBar(edge: .top) {
                        ForEach(style.getViews(for: .safeAreaTop).indices, id: \.self){ index in
                            style.getViews(for: .safeAreaTop)[index].view
                        }
                        .safeAreaPadding(.vertical, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
                        .safeAreaPadding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList))
                    }
                    .safeAreaBar(edge: .bottom) {
                        ForEach(style.getViews(for: .safeAreaBottom).indices, id: \.self){ index in
                            style.getViews(for: .safeAreaBottom)[index].view
                        }
                        .safeAreaPadding(.vertical, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
                        .safeAreaPadding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList))
                    }
            }else{
                content
            }
        }
    }

    @ViewBuilder
    private func scrollBody(proxy: ScrollViewProxy?) -> some View {
        if let proxy{
            LazyVStack {
                ForEach(style.getViews(for: .scrollContentTop).indices, id: \.self){ index in
                    style.getViews(for: .scrollContentTop)[index].view
                }
                content(proxy)
                
                ForEach(style.getViews(for: .scrollContentBottom).indices, id: \.self){ index in
                    style.getViews(for: .scrollContentTop)[index].view
                }
            }
            .padding(verticalEdges, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
            .padding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList))
        }else{
            
            content(proxy)
        }

    }
    
    @ViewBuilder
    private func renderInsetView(_ insetedViews: [SPInsetedView] = [], isTopEdge: Bool) -> some View {
        ForEach(insetedViews.indices, id: \.self){ index in
            insetedViews[index].view
        }
        .padding(isTopEdge ? .top : .bottom, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
        .padding(isTopEdge ? .bottom : .top, (SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0) * 0.5)
        .environment(\.spHorizontalPadding, SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0)
    }

    init(useScrollView: Bool, @ViewBuilder content: @escaping (ScrollViewProxy?) -> V) {
        self.useScrollView = useScrollView
        self.content = content
    }
}
