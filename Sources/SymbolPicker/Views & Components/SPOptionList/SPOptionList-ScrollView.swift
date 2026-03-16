//
//  SPOptionList-ScrollView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

struct SPOptionListScrollView<V: View, ProgressView: View>: View {
    @Environment(\.self) var environment
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.spPageType) var spPageType
    @Environment(\.spSelection) var spSelection
    @Environment(\.spSearchText) var spSearchText
    @Environment(\.symbolPickerStyle) var style
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @State private var offsetCalculated: CGFloat = 10
    @State private var scaleCalculated: CGFloat = 1.0
    let content: (ScrollViewProxy?) -> V
    let showProgressView: Bool
    let progressView: () -> ProgressView

    var verticalEdges: Edge.Set {
        #if os(macOS)
        return .vertical
        #else
        let topIsClear = style.getViews(for: .safeAreaTop).isEmpty
        
        let bottomIsClear = style.getViews(for: .safeAreaBottom).isEmpty

        switch (topIsClear, bottomIsClear) {
        case (true, true):   return .vertical
        case (true, false):  return .top
        case (false, true):  return .bottom
        case (false, false): return []
        }
        #endif
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                scrollTrigger()
                scrollBody(proxy: proxy)
                    .if { view in
                        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *) {
                            view
                                .spSmartSafeAreaPadding(verticalEdges, style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize))
                                .spSmartSafeAreaPadding(.horizontal, style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize))
                        } else {
                            view
                                .spSmartSafeAreaPadding(verticalEdges, style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize))
                                .spSmartSafeAreaPadding(.horizontal, style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize))
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
#elseif !os(tvOS)
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
                    #if compiler(>=6.2)
                    .safeAreaBar(edge: .top) {
                        let views = style.getViews(for: .safeAreaTop).filter { spShouldDisplay($0) }
                        ForEach(views.indices, id: \.self){ index in
                            let insetedView = views[index]
                            insetedView.view
                                .animation(.smooth, value: spPageType.wrappedValue)
                                .animation(.smooth, value: spSelection.wrappedValue.isContentAvailable())
                                .spSafeAreaPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: [.top: style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize)],
                                    horizontalDefault: [.horizontal: style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize)]
                                )
                                .if{ content in
                                    if let background = insetedView.background{
                                        content.background{ background}
                                    }else{ content }
                                }
                        }
                    }
                    .safeAreaBar(edge: .bottom) {
                        let views = style.getViews(for: .safeAreaBottom).filter { spShouldDisplay($0) }

                        ForEach(views.indices, id: \.self){ index in
                            let insetedView = views[index]
                            insetedView.view
                                .animation(.smooth, value: spPageType.wrappedValue)
                                .animation(.smooth, value: spSelection.wrappedValue.isContentAvailable())
                                .spSafeAreaPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: [.bottom: style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize)],
                                    horizontalDefault: [.horizontal: style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize)]
                                )
                                .if{ content in
                                    if let background = insetedView.background{
                                        content.background{ background}
                                    }else{ content }
                                }
                        }
                    }
                    #else
                    .safeAreaInset(edge: .top) {
                        let views = style.getViews(for: .safeAreaTop).filter { spShouldDisplay($0) }
                        ForEach(views.indices, id: \.self){ index in
                            let insetedView = views[index]
                            insetedView.view
                                .animation(.smooth, value: spPageType.wrappedValue)
                                .animation(.smooth, value: spSelection.wrappedValue.isContentAvailable())
                                #if os(visionOS) || os(iOS)
                                .spPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: [.top: style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize)],
                                    horizontalDefault: [.horizontal: 0]
                                )
                                #else
                                .spPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: [.top: style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize)],
                                    horizontalDefault: [.horizontal: style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize)]
                                )
                                #endif
                                .environment(\.spHorizontalPadding, style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize))
                                .background { insetedView.background }
                        }
                    }
                    .safeAreaInset(edge: .bottom) {
                        let views = style.getViews(for: .safeAreaBottom).filter { spShouldDisplay($0) }

                        ForEach(views.indices, id: \.self){ index in
                            let insetedView = views[index]
                            insetedView.view
                                .animation(.smooth, value: spPageType.wrappedValue)
                                .animation(.smooth, value: spSelection.wrappedValue.isContentAvailable())
                                #if os(visionOS) || os(iOS)
                                .spPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: [.bottom: style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize)],
                                    horizontalDefault: [.horizontal: 0]
                                )
                                #else
                                .spPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: [.bottom: style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize)],
                                    horizontalDefault: [.horizontal: style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize)]
                                )
                                #endif

                                .environment(\.spHorizontalPadding, style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize))
                                .background { insetedView.background }
                        }
                    }
                    #endif
            }else{
                content
                    .safeAreaInset(edge: .top) {
                        let views = style.getViews(for: .safeAreaTop).filter { spShouldDisplay($0) }
                        ForEach(views.indices, id: \.self){ index in
                            let insetedView = views[index]
                            insetedView.view
                                .animation(.smooth, value: spPageType.wrappedValue)
                                .animation(.smooth, value: spSelection.wrappedValue.isContentAvailable())
                                #if os(visionOS) || os(iOS)
                                .spPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: [.top: style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize)],
                                    horizontalDefault: [.horizontal: 0]
                                )
                                #else
                                .spPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: [.top: style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize)],
                                    horizontalDefault: [.horizontal: style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize)]
                                )
                                #endif
                                .environment(\.spHorizontalPadding, style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize))
                                .background { insetedView.background }
                        }
                    }
                    .safeAreaInset(edge: .bottom) {
                        let views = style.getViews(for: .safeAreaBottom).filter { spShouldDisplay($0) }

                        ForEach(views.indices, id: \.self){ index in
                            let insetedView = views[index]
                            insetedView.view
                                .animation(.smooth, value: spPageType.wrappedValue)
                                .animation(.smooth, value: spSelection.wrappedValue.isContentAvailable())
                                #if os(visionOS) || os(iOS)
                                .spPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: [.bottom: style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize)],
                                    horizontalDefault: [.horizontal: 0]
                                )
                                #else
                                .spPaddingForDictionary(
                                    insetedView.paddings,
                                    verticalDefault: [.bottom: style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize)],
                                    horizontalDefault: [.horizontal: style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize)]
                                )
                                #endif

                                .environment(\.spHorizontalPadding, style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize))
                                .background { insetedView.background }
                        }
                    }
            }
        }
        .environment(\.spPreviewCalculateOffset, offsetCalculated)
        .environment(\.spPreviewCalculateScale, scaleCalculated)
    }
    

    @ViewBuilder
    private func scrollBody(proxy: ScrollViewProxy) -> some View {
        LazyVStack {
            let topViews = style.getViews(for: .scrollContentTop).filter { spShouldDisplay($0) }
            if !topViews.isEmpty{
                ForEach(topViews.indices, id: \.self){ index in
                    let insetedView = topViews[index]
                    insetedView.view
                        .background { insetedView.background }
                }
                .spListStyleRow(forceListStyle: style.displayStyle == .detail)
            }
            
            LazyVStack{
                let topSectionViews = style.getViews(for: .scrollSectionTop).filter { spShouldDisplay($0) }
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
                let bottomSectionViews = style.getViews(for: .scrollSectionBottom).filter { spShouldDisplay($0) }
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
            
            let bottomViews = style.getViews(for: .scrollContentBottom).filter { spShouldDisplay($0) }
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
                .padding(verticalEdges, style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize))
                .padding(.horizontal, style.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize))
        }}
        #if os(macOS)
        .padding(.top, style.displayStyle == .compact ? style.spacings.getValue(.verticalPadding, for: .optionList, at: dynamicTypeSize) * -1.5 : 0)
        #endif
    }
    
    private func spShouldDisplay(_ insetedView: SPInsetedView) -> Bool {
        return insetedView.isDisplayed?(environment) ?? true
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
