# ``SymbolPicker/SPDataAsset/Body``

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

The view type for the asset.

## Overview

The `Body` associated type defines the SwiftUI `View` returned by ``SymbolPicker/SPDataAsset/asView()``.

### Generics

This type lets each model, like ``SPSymbol`` or ``SPEmoji``, define its own view while the system handles assets generically.

### Implementations
- **SPSymbol**: Uses ``SPSymbolView``.
- **SPEmoji**: Uses ``SPEmojiView``.
- **SPImage**: Uses ``SPImageView``.

### SwiftUI Compatibility

`Body` follows the `View` protocol. This ensures the picker's grid or list can render the component.

### Thread Safety

Configure the `Body` on the main actor to keep the UI thread safe.
