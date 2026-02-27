//
//  SPOptionList-ScrollView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

struct SPOptionListScrollView<V: View, ProgressView: View>: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.spPageType) var spPageType
    @Environment(\.spSearchText) var spSearchText
    @Environment(\.symbolPickerStyle) var style
    let content: (ScrollViewProxy?) -> V
    let showProgressView: Bool
    let progressView: () -> ProgressView

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
        ScrollViewReader { proxy in
            ScrollView {
                scrollTrigger()
                scrollBody(proxy: proxy)
                    .if { view in
                        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) {
                            view
                                .smartSafeAreaPadding(verticalEdges, SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0)
                                .smartSafeAreaPadding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0)
                        } else {
                            view
                        }
                    }
            }
            .onChange(of: spPageType.wrappedValue) { newValue in
                proxy.scrollTo(newValue, anchor: .top)
            }
            .onAppear { proxy.scrollTo(spPageType.wrappedValue, anchor: .top) }
        }
        .if{ content in
            if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *){
                content
                    .safeAreaBar(edge: .top) {
                        ForEach(style.getViews(for: .safeAreaTop).indices, id: \.self){ index in
                            let insetedView = style.getViews(for: .safeAreaTop)[index]
                            insetedView.view
                                .safeAreaPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0,
                                    horizontalDefault: SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0
                                )
                        }
                        
                    }
                    .safeAreaBar(edge: .bottom) {
                        ForEach(style.getViews(for: .safeAreaBottom).indices, id: \.self){ index in
                            let insetedView = style.getViews(for: .safeAreaBottom)[index]
                            insetedView.view
                                .safeAreaPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0,
                                    horizontalDefault: SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0
                                )
                        }
                    }
            }else{
                content
                    .safeAreaInset(edge: .top) {
                        ForEach(style.getViews(for: .safeAreaTop).indices, id: \.self){ index in
                            let insetedView = style.getViews(for: .safeAreaTop)[index]
                            insetedView.view
                                .padding(.top, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
                                .padding(.bottom, (SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0) * 0.5)
                                .environment(\.spHorizontalPadding, SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0)
                        }
                    }
                    .safeAreaInset(edge: .bottom) {
                        ForEach(style.getViews(for: .safeAreaBottom).indices, id: \.self){ index in
                            let insetedView = style.getViews(for: .safeAreaBottom)[index]
                            insetedView.view
                                .padding(.bottom, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
                                .padding(.top, (SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0) * 0.5)
                                .environment(\.spHorizontalPadding, SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0)
                        }
                    }
            }
        }
    }
    

    @ViewBuilder
    private func scrollBody(proxy: ScrollViewProxy) -> some View {
        LazyVStack {
            ForEach(style.getViews(for: .scrollContentTop).indices, id: \.self){ index in
                style.getViews(for: .scrollContentTop)[index].view
            }
            .spListStyleRow(forceListStyle: style.displayStyle == .detail)
            
            LazyVStack{
                ForEach(style.getViews(for: .scrollSectionTop).indices, id: \.self){ index in
                    style.getViews(for: .scrollSectionTop)[index].view
                }
                .spListStyleRow(forceListStyle: style.displayStyle != .detail || ![SPPageType.emoji, .symbol].contains(spPageType.wrappedValue))
                
                if showProgressView{
                    progressView()
                }else{
                    content(proxy)
                }
                ForEach(style.getViews(for: .scrollSectionBottom).indices, id: \.self){ index in
                    style.getViews(for: .scrollSectionBottom)[index].view
                }
                .spListStyleRow(forceListStyle: style.displayStyle != .detail || ![SPPageType.emoji, .symbol].contains(spPageType.wrappedValue))
            }
            .spListStyleRow(forceListStyle: style.displayStyle == .detail && [SPPageType.emoji, .symbol].contains(spPageType.wrappedValue))
            
            ForEach(style.getViews(for: .scrollContentBottom).indices, id: \.self){ index in
                style.getViews(for: .scrollContentBottom)[index].view
            }
            .spListStyleRow(forceListStyle: style.displayStyle == .detail)
        }
        .if { content in if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) { content} else {
            content
                .padding(verticalEdges, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
                .padding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList))
        }}
        #if os(macOS)
        .padding(.top, -(SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0))
        #endif
    }
    
    func scrollTrigger() -> some View{
        Rectangle()
            .frame(height: 1)
            .opacity(0)
            .id(spPageType.wrappedValue)
    }

    init(showProgress: Bool, @ViewBuilder content: @escaping (ScrollViewProxy?) -> V, @ViewBuilder progressView: @escaping () -> ProgressView) {
        self.content = content
        self.showProgressView = showProgress
        self.progressView = progressView
    }
}

