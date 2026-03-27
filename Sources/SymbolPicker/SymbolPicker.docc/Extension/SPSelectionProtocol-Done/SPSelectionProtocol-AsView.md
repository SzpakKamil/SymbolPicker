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

Returns a SwiftUI view for the selection.

- Returns: An `AnyView` that renders the symbol, emoji, image, or color.

## Overview

The `asView()` method is the main rendering tool in the SymbolPicker package. It handles different selection types, letting components like ``SymbolPicker/SPSelectionPreview`` display user choices without knowing their underlying model.

### Rendering Logic

The implementation switches over the selection type:
- **Symbols**: Calls ``SymbolPicker/SPSymbol/asView()``.
- **Emojis**: Initializes an ``SymbolPicker/SPEmojiView``.
- **Images**: Initializes an ``SymbolPicker/SPImageView``.
- **Colors**: Draws a `Circle` filled with the selection color.

### Thread Safety

The method uses the `@MainActor` attribute. This ensures all view creation happens on the main thread for SwiftUI compatibility.

### Usage

The selection preview area calls this method whenever the user makes a choice. It allows the UI to update instantly, regardless of the asset type.
