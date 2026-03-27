# ``SymbolPicker/SPEmoji/Skin/id``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

A unique identifier for the skin variation.

## Overview

The `id` property uniquely identifies an `SPEmoji.Skin` instance. It uses the composite Unicode hexcode for the variation.

### Format

The identifier stores the combination of scalars that define the variation, such as `"1F44B-1F3FB"` for a light skin tone waving hand. For complex variations, hyphens join multiple scalar hexcodes.

### Usage

The `id` maintains stability in SwiftUI collections like grids or lists. It also serves as the source for the glyph via ``SymbolPicker/SPEmoji/Skin/emojiString()``. The parent `SPEmoji` uses this value to track and save the selected skin tone.
