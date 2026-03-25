# ``SymbolPicker/SPSelection/asView()``

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

Converts the selection into a SwiftUI view for rendering.

## Overview

The `asView()` method is the primary way to display an ``SymbolPicker/SPSelection`` in your UI. It handles the logic of switching between different asset types (symbols, emojis, images, and colors) and returns an `AnyView` that can be integrated into any SwiftUI layout.

### Dynamic Rendering

The returned view is determined by the selection ``SymbolPicker/SPSelection/type``:

- **Symbol**: Renders the symbol using ``SymbolPicker/SPSymbolView``.
- **Emoji**: Renders the emoji using ``SymbolPicker/SPEmojiView``.
- **Image**: Renders the image using ``SymbolPicker/SPImageView``.
- **Color**: Renders the color as a simple circular fill.

### MainActor Requirement

Because this method creates SwiftUI views, it is marked with `@MainActor`. This ensures that view creation always occurs on the main thread, preventing potential threading issues in your application's UI layer.

### Protocol Conformance

This method fulfills the requirements of the ``SymbolPicker/SPSelectionProtocol``, allowing the `SymbolPicker` library to render selections uniformly regardless of their underlying asset type.
