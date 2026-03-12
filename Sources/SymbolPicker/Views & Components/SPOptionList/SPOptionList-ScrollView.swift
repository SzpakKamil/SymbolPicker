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
    @Environment(\.spSelection) var spSelection
    @Environment(\.spSearchText) var spSearchText
    @Environment(\.symbolPickerStyle) var style
    @State private var offsetCalculated: CGFloat = 10
    @State private var scaleCalculated: CGFloat = 1.0
    let content: (ScrollViewProxy?) -> V
    let showProgressView: Bool
    let progressView: () -> ProgressView

    var verticalEdges: Edge.Set {
        let topIsClear = style.getViews(for: .safeAreaTop).isEmpty
        
        let bottomIsClear = style.getViews(for: .safeAreaBottom).isEmpty

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
#if os(visionOS) || os(watchOS)
            .onChange(of: spPageType.wrappedValue) { _, newValue in
#if os(visonOS)
                proxy.scrollTo(newValue, anchor: .top)
#else
                if style.displayStyle == .compact && newValue != .emoji && newValue != .symbol{
                    proxy.scrollTo(newValue, anchor: .top)
                }
#endif
            }
            .onChange(of: spSearchText.wrappedValue){ _ in
                proxy.scrollTo(spPageType.wrappedValue, anchor: .top)
            }
#else
            .onChange(of: spPageType.wrappedValue) { newValue in
                #if os(iOS)
                withAnimation{
                    proxy.scrollTo(newValue, anchor: .top)
                }
                #elseif os(macOS)
                if spPageType.wrappedValue != .symbol && spPageType.wrappedValue != .emoji{
                    proxy.scrollTo(newValue, anchor: .top)
                }
                #else
                proxy.scrollTo(newValue, anchor: .top)
                #endif
            }
            .onChange(of: spSearchText.wrappedValue){ _ in
                withAnimation{
                    proxy.scrollTo(spPageType.wrappedValue, anchor: .top)
                }
            }
            #endif
            #if os(iOS) || os(visionOS) || os(macOS) || os(tvOS)
            .if{ content in
                if #available(iOS 26.0, visionOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *){
                    content.onScrollGeometryChange(for: [CGFloat].self, of: { geometry in
                        [geometry.bounds.minY, geometry.contentInsets.top]
                    }, action: { oldValue, newValue in
                        let minY = newValue[0]
                        let topInset = newValue[1]
                        
                        let start = -topInset
                        let end = start + 61
                        
                        let progress = min(max((start - minY) / (start - end), 0), 1)
                        let newOffsetCalculated = 10 - (30 * progress)
                        
                        if abs(offsetCalculated - newOffsetCalculated) > 0.5 {
                            offsetCalculated = newOffsetCalculated
                        }
                        
                        let newScaleCalculated =  1.0 - 0.5 * progress // Scales from 1.0 to 0.5
                        
                        if abs(scaleCalculated - newScaleCalculated) > 0.01 {
                            scaleCalculated = newScaleCalculated
                        }
                    })
                }else{ content }
            }
#endif
        }
        .if{ content in
            if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *){
                content
                    .safeAreaBar(edge: .top) {
                        ForEach(style.getViews(for: .safeAreaTop).indices, id: \.self){ index in
                            let insetedView = style.getViews(for: .safeAreaTop)[index]
                            insetedView.view
                                .animation(.smooth, value: spPageType.wrappedValue)
                                .animation(.smooth, value: spSelection.wrappedValue.isContentAvailable())
                                .safeAreaPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0,
                                    horizontalDefault: SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0
                                )
                                .if{ content in
                                    if let background = insetedView.background{
                                        content.background{ background}
                                    }else{ content }
                                }
                        }
                    }
                    .safeAreaBar(edge: .bottom) {
                        ForEach(style.getViews(for: .safeAreaBottom).indices, id: \.self){ index in
                            let insetedView = style.getViews(for: .safeAreaBottom)[index]
                            insetedView.view
                                .animation(.smooth, value: spPageType.wrappedValue)
                                .animation(.smooth, value: spSelection.wrappedValue.isContentAvailable())
                                .safeAreaPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0,
                                    horizontalDefault: SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0
                                )
                                .if{ content in
                                    if let background = insetedView.background{
                                        content.background{ background}
                                    }else{ content }
                                }
                        }
                    }
            }else{
                content
                    .safeAreaInset(edge: .top) {
                        ForEach(style.getViews(for: .safeAreaTop).indices, id: \.self){ index in
                            let insetedView = style.getViews(for: .safeAreaTop)[index]
                            insetedView.view
                                .animation(.smooth, value: spPageType.wrappedValue)
                                .animation(.smooth, value: spSelection.wrappedValue.isContentAvailable())
                                .padding(.top, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
                                .padding(.bottom, (SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0) * 0.5)
                                .environment(\.spHorizontalPadding, SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0)
                                .background { insetedView.background }
                        }
                    }
                    .safeAreaInset(edge: .bottom) {
                        ForEach(style.getViews(for: .safeAreaBottom).indices, id: \.self){ index in
                            let insetedView = style.getViews(for: .safeAreaBottom)[index]
                            insetedView.view
                                .animation(.smooth, value: spPageType.wrappedValue)
                                .animation(.smooth, value: spSelection.wrappedValue.isContentAvailable())
                                .padding(.bottom, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
                                .padding(.top, (SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0) * 0.5)
                                .environment(\.spHorizontalPadding, SPSpacing.getHorizonalPadding(for: style.spacing.optionList) ?? 0)
                                .background { insetedView.background }
                        }
                    }
            }
        }
        .environment(\.spCalculateOffset, offsetCalculated)
        .environment(\.spCalculateScale, scaleCalculated)
    }
    

    @ViewBuilder
    private func scrollBody(proxy: ScrollViewProxy) -> some View {
        LazyVStack {
            let topViews = style.getViews(for: .scrollContentTop)
            if !topViews.isEmpty{
                ForEach(topViews.indices, id: \.self){ index in
                    let insetedView = topViews[index]
                    insetedView.view
                        .background { insetedView.background }
                }
                .spListStyleRow(forceListStyle: style.displayStyle == .detail)
            }
            
            LazyVStack{
                let topSectionViews = style.getViews(for: .scrollSectionTop)
                if !topSectionViews.isEmpty{
                    ForEach(topSectionViews.indices, id: \.self){ index in
                        let insetedView = topSectionViews[index]
                        insetedView.view
                            .background { insetedView.background }
                    }
                    .spListStyleRow(forceListStyle: style.displayStyle != .detail || ![SPPageType.emoji, .symbol].contains(spPageType.wrappedValue))
                }
                
                if showProgressView{
                    progressView()
                }else{
                    content(proxy)
                }
                let bottomSectionViews = style.getViews(for: .scrollSectionBottom)
                if !bottomSectionViews.isEmpty{
                    ForEach(bottomSectionViews.indices, id: \.self){ index in
                        let insetedView = bottomSectionViews[index]
                        insetedView.view
                            .background { insetedView.background }
                    }
                    .spListStyleRow(forceListStyle: style.displayStyle != .detail || ![SPPageType.emoji, .symbol].contains(spPageType.wrappedValue))
                }
            }
            .spListStyleRow(forceListStyle: style.displayStyle == .detail && [SPPageType.emoji, .symbol].contains(spPageType.wrappedValue))
            
            let bottomViews = style.getViews(for: .scrollContentBottom)
            if !bottomViews.isEmpty{
                ForEach(bottomViews.indices, id: \.self){ index in
                    let insetedView = bottomViews[index]
                    insetedView.view
                        .background { insetedView.background }
                }
                .spListStyleRow(forceListStyle: style.displayStyle == .detail)
            }
        }
        .if { content in if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *) { content} else {
            content
                .padding(verticalEdges, SPSpacing.getVerticalPadding(for: style.spacing.optionList))
                .padding(.horizontal, SPSpacing.getHorizonalPadding(for: style.spacing.optionList))
        }}
        #if os(macOS)
        .padding(.top, style.displayStyle == .compact ? (SPSpacing.getVerticalPadding(for: style.spacing.optionList) ?? 0) * -1.5 : 0)
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

