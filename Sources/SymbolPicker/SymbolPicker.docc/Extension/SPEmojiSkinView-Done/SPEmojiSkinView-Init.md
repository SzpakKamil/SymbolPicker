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

Initialize an emoji skin view with a skin model. The `init(skin:)` method creates a component to render a specific emoji variation.

### Parameter Configuration

- **`skin`**: The ``SymbolPicker/SPEmoji/Skin`` data model containing the hexcode for the skin tone variation.

### Initialization Process

The view stores the provided ``SymbolPicker/SPEmoji/Skin`` model during initialization. It resolves the emoji string and checks platform availability dynamically when rendering its body. This ensures the correct variant appears on every supported OS.
