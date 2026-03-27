# ``SymbolPicker/SPEmojiView/init(emoji:)``

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

Creates an emoji view.

## Overview

The `init(emoji:)` initializer builds a rendering component for a specific emoji.

### Parameters

- **`emoji`**: The ``SymbolPicker/SPEmoji`` model containing the character data and metadata.

### Process

The view stores the provided ``SymbolPicker/SPEmoji`` model. The system resolves the emoji string, checks platform support, and sets accessibility labels within the view's body during layout.
