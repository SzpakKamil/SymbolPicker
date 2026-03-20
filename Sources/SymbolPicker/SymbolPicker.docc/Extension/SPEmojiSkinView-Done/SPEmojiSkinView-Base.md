# ``SymbolPicker/SPEmojiSkinView``

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

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

A specialized view for rendering specific emoji skin tone variations with support for dynamic scaling and availability fallbacks.

## Overview

`SPEmojiSkinView` is a text-based rendering component designed to display specific skin tone variants of an emoji within the ``SymbolPicker`` package. It is used primarily when a user selects a specific tone from an ``SymbolPicker/SPEmoji`` that supports multiple variations.

### Usage

To use `SPEmojiSkinView`, initialize it with an instance of ``SymbolPicker/SPEmoji/Skin``:

```swift
import SwiftUI
import SymbolPicker

struct MySkinTonePreview: View {
    // Thumbs Up: Light Skin Tone (👍🏻)
    let skin = SPEmoji.Skin(
        id: "1F44D-1F3FB", 
        annotation: "Thumbs Up: Light Skin Tone", 
        version: 2.0
    )

    var body: some View {
        SPEmojiSkinView(skin: skin)
            .frame(width: 44, height: 44)
    }
}
```

### High-Fidelity Rendering

Similar to ``SymbolPicker/SPEmojiView``, this view optimizes the rendering of emoji characters:
- **Maximum Scale**: The view is initialized with a high base font size (e.g., `300`). 
- **Dynamic Scaling**: It uses `.minimumScaleFactor(0.01)` to ensure that the skin tone variation automatically scales down to fit within its containing frame.
- **Single-Line Layout**: Enforces a single-line limit to maintain visual consistency.

### Platform and OS Awareness

Skin tone variations are also subject to OS-level support:
- **Automatic Fallback**: If an ``SymbolPicker/SPEmoji/Skin`` is flagged as unavailable on the current system (via ``SymbolPicker/SPEmoji/Skin/isAvailable()``), the view automatically displays a standardized "question mark" symbol instead.

### Accessibility

`SPEmojiSkinView` inherits accessibility behavior from the underlying emoji model. While it does not explicitly define its own accessibility label (as it is typically used within a larger component like ``SymbolPicker/SPEmojiView`` or a picker cell), it maintains the visual integrity required for high-contrast and large-text accessibility modes.

### Rendering Performance

To maintain a high frame rate when rendering many skin tone variations, `SPEmojiSkinView` uses the `.drawingGroup()` modifier. This leverages GPU-accelerated rendering, ensuring smooth performance even during complex scrolling or layout transitions.

## Topics

### Initialization

- ``SymbolPicker/SPEmojiSkinView/init(skin:)``
