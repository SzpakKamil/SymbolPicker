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

A unique identifier for the skin variation, typically its composite Unicode hexcode.

## Overview

The `id` property is the unique identifier for an `SPEmoji.Skin` instance. This identifier is essential for maintaining the stability of SwiftUI collection views (e.g., in a grid or list) when the variation data is used in conjunction with the `Identifiable` protocol.

### Format and Composition

The `id` is a hexcode string representing the precise combination of scalars that define the variation (e.g., `"1F44B-1F3FB"` for the Waving Hand: Light Skin Tone). For complex emoji variations, multiple scalar hexcodes are joined by hyphens, following standard Unicode naming conventions.

### Role in the Lifecycle

Beyond its identification purpose, the `id` serves as the primary source for resolving the actual emoji glyph via ``SymbolPicker/SPEmoji/Skin/emojiString()``. It is also the value used by the parent `SPEmoji` instance to identify and persist the currently selected skin variation.
