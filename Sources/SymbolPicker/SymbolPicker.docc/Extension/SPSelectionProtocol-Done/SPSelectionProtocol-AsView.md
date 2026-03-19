# ``SymbolPicker/SPSelectionProtocol/asView()``

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

Returns a SwiftUI `AnyView` representation of the current selection.

- Returns: A type-erased `AnyView` that renders the current symbol, emoji, image, or color.

## Overview

The `asView()` method is the primary way to render a selection within the `SymbolPicker` package. It abstracts the complexity of different selection types, allowing preview components like ``SymbolPicker/SPSelectionPreview`` to display any selection without knowing its specific type.

### UI Rendering Logic

The implementation of `asView()` typically switches over the internal selection type to provide the appropriate visual representation:
- **Symbols**: Renders the symbol using its own `asView()` method (e.g., ``SymbolPicker/SPSymbol/asView()``).
- **Emojis**: Renders the emoji using an ``SymbolPicker/SPEmojiView``.
- **Images**: Renders the custom photo using an ``SymbolPicker/SPImageView``.
- **Colors**: Renders a simple `Circle` filled with the selection's color.

### Main Actor Safety

Because `asView()` creates SwiftUI views, it is decorated with `@MainActor`. This ensures that view creation always occurs on the main thread, maintaining UI thread safety and consistency.

### Usage in Previews

This method is extensively used in the selection preview area of the picker. By calling `asView()` on the current selection, the preview component can dynamically update its content whenever the user makes a new choice, regardless of whether that choice is a symbol or a custom photo.
