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

A unique identifier for the emoji.

## Overview

The `id` property uniquely identifies an `SPEmoji` instance. It keeps the state stable when you use emojis in SwiftUI `List` or `LazyVGrid` containers.

### Format

The property uses the standard Unicode hexcode, such as `"1F600"` for a grinning face. For emojis with multiple scalars, hyphens join the hexcodes, like `"1F1F5-1F1F1"` for the Polish flag.

### Usage

The `id` is the source for the character via ``SymbolPicker/SPEmoji/emojiString()``. It also serves as the key for saving and restoring user selections.
