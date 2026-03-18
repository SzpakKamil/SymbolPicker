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

Returns a SwiftUI representation of the asset, supporting SF Symbols, Emojis, and custom icons.

- Returns: A view that renders the asset.

## Overview

The `asView()` method is the core requirement for rendering assets within the `SymbolPicker` package. It provides a standardized way for each asset type to define its own visual representation while remaining compatible with the picker's generic UI components.

### UI Integration

When building the picker grid or list, the ``SymbolPicker/SPOptionList`` calls `asView()` on each asset to obtain its rendering. This allows the picker to uniformly display different asset types:
- **SPSymbol**: For symbols, `asView()` returns a `SPSymbolView`.
- **SPEmoji**: For emojis, `asView()` returns a `SPEmojiView`.
- **SPImage**: For custom images, `asView()` returns a `SPImageView`.

### Specialized Rendering

The conforming type's implementation of `asView()` should handle any specific rendering requirements for that asset. For example, `SPEmojiView` can manage skin tone variants, and `SPSymbolView` can handle variant configurations.

### Main Actor Decoration

Because `asView()` is responsible for creating SwiftUI views, it is decorated with `@MainActor` to ensure that it is always called on the main thread, maintaining UI thread safety.

### Generic Component Support

By returning a concrete view type (specified by the ``SymbolPicker/SPDataAsset/Body`` associated type), `asView()` allows the picker's higher-level components to remain generic and flexible.
