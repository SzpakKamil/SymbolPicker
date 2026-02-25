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
        VStack{
            if useScrollView {
                ScrollViewReader { proxy in
                    ScrollView {
                        scrollBody(proxy: proxy)
                    }
                    .if { view in
                        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) {
                            view
                                .smartSafeAreaPadding(verticalEdges, SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0)
                                .smartSafeAreaPadding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0)
                        } else {
                            view
                        }
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
        }
        .if{ content in
            if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *){
                content
                    .safeAreaBar(edge: .top) {
                        ForEach(style.getViews(for: .safeAreaTop).indices, id: \.self){ index in
                            let insetedView = style.getViews(for: .safeAreaTop)[index]
                            if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *){
                                insetedView.view
                                    .safeAreaPaddingForDictionary(
                                        insetedView.paddings,
                                        verticalDefault: SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0,
                                        horizontalDefault: SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0
                                    )
                            }

                        }
         
                    }
                    .safeAreaBar(edge: .bottom) {
                        ForEach(style.getViews(for: .safeAreaBottom).indices, id: \.self){ index in
                            let insetedView = style.getViews(for: .safeAreaBottom)[index]
                            if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *){
                                insetedView.view
                                    .safeAreaPaddingForDictionary(
                                        insetedView.paddings,
                                        verticalDefault: SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0,
                                        horizontalDefault: SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0
                                    )
                            }
                            
                        }
                    }
            }else{
                content
                    .safeAreaInset(edge: .top) {
                        renderInsetView(isTopEdge: true)
                    }
                    .safeAreaInset(edge: .bottom) {
                        renderInsetView(isTopEdge: false)
                    }
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
                    style.getViews(for: .scrollContentBottom)[index].view
                }
            }
            .if { content in
                if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) {
                    content // Handled by smartSafeAreaPadding on ScrollView
                } else {
                    content
                        .padding(verticalEdges, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
                        .padding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList))
                }
            }
        }else{
            content(proxy)
                .padding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList))
        }

    }
    
    @ViewBuilder
    private func renderInsetView(_ insetedViews: [SPInsetedView] = [], isTopEdge: Bool) -> some View {
        ForEach(insetedViews.indices, id: \.self){ index in
            let insetedView = insetedViews[index]
            if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *){
                insetedView.view
                    .paddingForDictionary(
                        insetedView.paddings,
                        verticalDefault: SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0,
                        horizontalDefault: SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0
                    )
            } else {
                insetedView.view
                    .padding(isTopEdge ? .top : .bottom, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
                    .padding(isTopEdge ? .bottom : .top, (SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0) * 0.5)
                    .padding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList))
            }
        }
        .environment(\.spHorizontalPadding, SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0)
    }

    init(useScrollView: Bool, @ViewBuilder content: @escaping (ScrollViewProxy?) -> V) {
        self.useScrollView = useScrollView
        self.content = content
    }
}
