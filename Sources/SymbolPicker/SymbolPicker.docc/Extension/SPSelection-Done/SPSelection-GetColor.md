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

The `getColor()` method provides access to the selection's color property. Depending on the selection type, this color may represent the primary selection itself (for `.color` type) or a tint applied to another asset (for `symbol`, `emoji`, or `image`).

### Usage in Custom Views

This method is useful when you need to access the selection's color for your own custom rendering logic, ensuring that you always have the correct color value regardless of the asset type.
