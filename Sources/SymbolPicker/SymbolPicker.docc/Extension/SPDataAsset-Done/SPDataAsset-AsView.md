# ``SymbolPicker/SPDataAsset/asView()``

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

Returns a SwiftUI view of the asset.

- Returns: A view that renders the asset.

## Overview

The `asView()` method is the main rendering requirement for the `SymbolPicker` package. It standardizes how each asset type defines its visual look while staying compatible with the picker's generic UI.

### UI Integration

``SymbolPicker/SPOptionList`` calls `asView()` on each asset to build the grid or list. This lets the picker show different types in the same way:
- **SPSymbol**: Returns a ``SPSymbolView``.
- **SPEmoji**: Returns a ``SPEmojiView``.

### Specialized Rendering

The ``asView()`` implementation handles specific needs. For example, ``SPEmojiView`` manages skin tones and ``SPSymbolView`` sets variants.

### Thread Safety

The method uses the `@MainActor` attribute to ensure it runs on the main thread for SwiftUI.

### Generics

By returning a view type defined by the ``SymbolPicker/SPDataAsset/Body`` associated type, `asView()` keeps high-level components flexible.
