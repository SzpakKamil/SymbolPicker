//
//  SPOptionListSkinView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

struct SPOptionListSkinView<T: SPDataAsset>: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selection: SPSelection<T>
    #if os(tvOS)
    @FocusState private var focusedIndex: Int?
    #endif
    let emoji: SPEmoji
    let size: CGFloat
    let columns: [GridItem]
    
    private var selectedEmoji: SPEmoji? {
        selection.getEmoji()
    }
    
    private var isThisEmojiSelected: Bool {
        selectedEmoji?.id == emoji.id
    }
    
    private var availableSkins: [SPEmoji.Skin] {
        emoji.skins?.filter { $0.isAvailable() } ?? []
    }
    
    var body: some View {
        #if os(watchOS) || os(tvOS)
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), alignment: .center, spacing: size * 0.3) {
                #if os(watchOS)
                content(watchSize: size * 1.2)
                #else
                content()
                #endif
            }
            .padding(.horizontal, {
                #if os(tvOS)
                if #available(tvOS 26.0, *) {
                    return 20
                } else {
                    return 80
                }
                #else
                return 20
                #endif
            }())
            .padding(.vertical, {
                #if os(tvOS)
                if #available(tvOS 26.0, *) {
                    return 20
                } else {
                    return 80
                }
                #else
                return 20
                #endif
            }())
        }
        #if os(tvOS)
        .if { content in
            if #available(tvOS 26.0, *) {
                content.frame(minWidth: 600, maxHeight: 500)
            } else {
                content
            }
        }
        #endif
        #else
        Group {
            #if os(iOS)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: size * 0.3) {
                    content()
                }
                .padding()
            }
            .frame(width: min(size * 10, UIScreen.main.bounds.width * 0.8))
            #else
            VStack(spacing: 0) {
                LazyVGrid(columns: columns, alignment: .center, spacing: size * 0.3) {
                    content()
                }
                .padding()
            }
            .frame(idealWidth: size * 11)
            #if os(macOS) || os(visionOS)
            .frame(width: size * 12)
            #endif
            #endif
        }
        #endif
    }

    @ViewBuilder
    private func content(watchSize: CGFloat? = nil) -> some View {
        let displaySize = watchSize ?? size
        Button {
            var baseEmoji = emoji
            baseEmoji.tone = 0
            var updatedSelection = selection
            updatedSelection.setEmoji(baseEmoji)
            selection = updatedSelection
            #if os(watchOS) || os(tvOS)
            dismiss()
            #endif
        } label: {
            SPEmojiView(emoji: emojiWithTone(0))
        }
        #if os(tvOS)
        .focused($focusedIndex, equals: 0)
        #endif
        .buttonStyle(SPOptionListButtonStyle(
            isSelected: isThisEmojiSelected && (selectedEmoji?.tone ?? 0) == 0,
            isFocused: {
                #if os(tvOS)
                return focusedIndex == 0
                #else
                return false
                #endif
            }(),
            size: displaySize
        ))

        // Skin variants
        let skins = availableSkins
        if !skins.isEmpty {
            ForEach(skins.indices, id: \.self) { index in
                Button {
                    var updatedSelection = selection
                    updatedSelection.setEmoji(emojiWithTone(index + 1))
                    selection = updatedSelection
                    #if os(watchOS) || os(tvOS)
                    dismiss()
                    #endif
                } label: {
                    SPEmojiSkinView(skin: skins[index])
                }
                #if os(tvOS)
                .focused($focusedIndex, equals: index + 1)
                #endif
                .buttonStyle(SPOptionListButtonStyle(
                    isSelected: isThisEmojiSelected && selectedEmoji?.tone == index + 1,
                    isFocused: {
                        #if os(tvOS)
                        return focusedIndex == index + 1
                        #else
                        return false
                        #endif
                    }(),
                    size: displaySize
                ))
            }
        }
    }
    
    private func emojiWithTone(_ tone: Int) -> SPEmoji {
        var newEmoji = emoji
        newEmoji.tone = tone
        return newEmoji
    }
}

