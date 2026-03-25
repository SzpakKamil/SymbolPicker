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

The `setImage(_:)` method switches the current ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/image`` and updates the underlying image data.

### Mutating State

When this method is called:
- The ``SymbolPicker/SPSelection/type`` is set to `.image`.
- The ``SymbolPicker/SPSelection/image`` property is updated with the new asset.
- Any existing symbol or emoji data is cleared by setting those properties to `nil`.
- **Automatic Color Overwrite**: If the provided image has an average color available, the ``SymbolPicker/SPSelection/color`` property is automatically updated to this value, replacing any previously selected color.

### Asset Transitions

By clearing the other asset properties, `SPSelection` maintains its integrity as a polymorphic structure that only represents one type of content at a time. This ensures that the rendered view (via ``SymbolPicker/SPSelection/asView()``) always matches the intended selection.
