# ``SymbolPicker/SPSelection/getColor()``

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

Returns the color currently associated with the selection.

- Returns: The `ColorKit/CKColor` assigned to the selection, or `nil` if no color is set.

## Overview

Get the color assigned to a selection. The `getColor()` method returns a `ColorKit/CKColor` or `nil` if no color is set. 

### Contextual Color

This color represents the main selection for `.color` types or a tint for symbols, emojis, and images. Use this method in custom views to ensure your rendering logic uses the correct color value regardless of the asset type. It provides a safe way to extract color data for persistence or custom UI elements.
