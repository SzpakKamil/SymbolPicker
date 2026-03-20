# ``SymbolPicker/SPEmoji/id``

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

A unique identifier for the emoji, typically its primary Unicode hexcode.

## Overview

The `id` property serves as the unique identifier for the `SPEmoji` instance, ensuring stability when the emoji is used in SwiftUI collections like `List` or `LazyVGrid`.

### Format and Generation

The identifier follows the standard Unicode hexcode format (e.g., `"1F600"` for Grinning Face). For complex emojis consisting of multiple scalars, the components are joined by hyphens (e.g., `"1F1F5-1F1F1"` for the flag of Poland).

### Usage

Beyond fulfilling the `Identifiable` protocol, the `id` is the primary source for resolving the actual emoji character via ``SymbolPicker/SPEmoji/emojiString()``. It is also used as the key when persisting user selections.
