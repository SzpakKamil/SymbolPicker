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

Initializes a new emoji view with a provided emoji model.

## Overview

The `init(emoji:)` initializer creates a rendering component for a specific emoji asset.

### Parameter Configuration

- **`emoji`**: The ``SymbolPicker/SPEmoji`` data model containing the emoji's character, availability, and localization.

### Initialization Process

Upon initialization, the view stores the provided ``SymbolPicker/SPEmoji`` model. The actual logic for resolving the emoji string, checking native platform availability, and configuring accessibility labels is handled dynamically within the view's body property based on the current environment and model properties.
