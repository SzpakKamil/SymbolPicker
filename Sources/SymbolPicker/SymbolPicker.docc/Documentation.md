# ``SymbolPicker``

Symbols, Evolved.

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "16.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticTitleHeading(enabled)
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

## Overview

SymbolPicker offers a unified, modular interface for selecting SF Symbols, Emojis, Colors, and Images across all Apple platforms. It provides a highly customizable, platform-adaptive library that scales with your app's needs.

@Image(source: "SymbolPicker-Banner", alt: "SymbolPicker banner showing various symbols and icons.")

## Getting Started

@Links(visualStyle: detailedGrid) {
    - <doc:AboutSymbolPicker>
    - <doc:SetUp>
}

## Resources

@Links(visualStyle: detailedGrid) {
    - <doc:Modifiers>
    - <doc:SPSymbol>
    - <doc:SPSelection>
    - <doc:SPDisplayStyle>
    - <doc:SPPageType>
    - <doc:SymbolPickerConfiguration>
}

## Topics

### Essentials
- <doc:AboutSymbolPicker>
- <doc:SetUp>
- <doc:Modifiers>

### Components
- ``SymbolPicker/SymbolPicker``
- ``SymbolPicker/SPSelectionView``
- ``SymbolPicker/SPSelectionPreview``
- ``SymbolPicker/SPSymbolView``
- ``SymbolPicker/SPEmojiView``
- ``SymbolPicker/SPEmojiSkinView``
- ``SymbolPicker/SPImageView``
- ``SymbolPicker/SPPagePicker``
- ``SymbolPicker/SPColorPicker``
- ``SymbolPicker/SPSearchBar``
- ``SymbolPicker/SPOptionList``
- ``SymbolPicker/SPDismissButton``
- ``SymbolPicker/SPInsetedView``

### Data Models
- ``SymbolPicker/SPSelection``
- ``SymbolPicker/SPSymbol``
- ``SymbolPicker/SPEmoji``
- ``SymbolPicker/SPImage``
- ``SymbolPicker/SPDataAsset``
- ``SymbolPicker/SPCategory``

### Protocols
- ``SymbolPicker/SPSelectionProtocol``

### Configuration
- ``SymbolPicker/SymbolPickerConfiguration``
- ``SymbolPicker/SymbolPickerDefaultConfiguration``
- ``SymbolPicker/SPPresentationConfiguration``
- ``SymbolPicker/SPColorPickerConfiguration``
- ``SymbolPicker/SPOptionListConfiguration``
- ``SymbolPicker/SPSelectionPreviewConfiguration``

### Options
- ``SymbolPicker/SPDisplayStyle``
- ``SymbolPicker/SPPageType``

### Layout & Builders
- ``SymbolPicker/SPSpacing``
- ``SymbolPicker/SPSpacingBuilder``
- ``SymbolPicker/SPInsetedViewBuilder``
- ``SymbolPicker/SymbolPickerModifier``

### Utilities
- ``SymbolPicker/SPDataManager``
- ``SymbolPicker/SPSupportedPlatforms``

### Extensions
- <doc:SwiftUICore/View>
- <doc:SwiftUICore/EnvironmentValues>
- <doc:Swift/Sequence>
