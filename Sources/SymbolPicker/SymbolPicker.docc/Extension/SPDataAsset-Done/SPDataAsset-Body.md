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

The type of view that represents the asset in the UI, supporting SF Symbols, Emojis, and custom icons.

## Overview

The `Body` associated type is a requirement of the ``SymbolPicker/SPDataAsset`` protocol that specifies the concrete SwiftUI `View` type returned by the ``SymbolPicker/SPDataAsset/asView()`` method.

### Generic Programming

By using an associated type, the ``SPDataAsset`` protocol allows each conforming type (e.g., ``SPSymbol``, ``SPEmoji``) to define its own specific view representation while still allowing the system to work with assets generically.

### Implementation

When a type conforms to ``SPDataAsset``, it must provide a concrete `Body` type. For example:
- For **SPSymbol**, the `Body` is ``SPSymbolView``.
- For **SPEmoji**, the `Body` is ``SPEmojiView``.
- For **SPImage**, the `Body` is ``SPImageView``.

### SwiftUI Compatibility

The `Body` associated type must conform to the `View` protocol, ensuring that the returned object is a valid SwiftUI component that can be rendered in the picker's grid or list layouts.

### Main Actor Decoration

Because the `Body` type represents a SwiftUI view, any logic used to generate or configure it within ``asView()`` should be performed on the main actor to maintain UI thread safety.
