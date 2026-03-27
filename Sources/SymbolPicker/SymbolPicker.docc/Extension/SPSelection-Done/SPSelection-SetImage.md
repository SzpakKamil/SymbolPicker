# ``SymbolPicker/SPSelection/setImage(_:)``

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

Updates the selection to a custom image asset.

- Parameter image: The new ``SymbolPicker/SPImage`` to set as the selection.

## Overview

Update the selection to a custom image asset. The `setImage(_:)` method switches the selection ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/image`` and refreshes the image data.

### Mutating State

Calling this method clears any existing symbol or emoji data by setting those properties to `nil`. This maintains the integrity of the selection as a structure that represents only one type of content at a time.

### Automatic Color Overwrite

If the new image includes an average color, the method automatically updates the ``SymbolPicker/SPSelection/color`` property with this value. This replaces any previously selected tint, ensuring the rendered view (via ``SymbolPicker/SPSelection/asView()``) matches the new asset's visual characteristics.
