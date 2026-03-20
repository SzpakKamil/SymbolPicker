# ``SymbolPicker/SPEmojiSkinView/init(skin:)``

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

Initializes a new emoji skin view with a provided skin model.

## Overview

The `init(skin:)` initializer creates a rendering component for a specific emoji skin tone variation.

### Parameter Configuration

- **`skin`**: The ``SymbolPicker/SPEmoji/Skin`` data model containing the specific hexcode for the skin tone variation.

### Initialization Process

Upon initialization, the view simply stores the provided ``SymbolPicker/SPEmoji/Skin`` model. The logic for resolving the emoji string and checking platform availability is handled dynamically within the view's body property.
