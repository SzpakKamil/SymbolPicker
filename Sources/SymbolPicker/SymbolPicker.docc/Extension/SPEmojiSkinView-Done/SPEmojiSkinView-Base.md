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

A specialized view for rendering emoji skin tone variations.

## Overview

`SPEmojiSkinView` renders specific emoji skin tone variations. It supports dynamic scaling and handles availability fallbacks. You use this view when a user selects a tone from an ``SymbolPicker/SPEmoji`` that supports multiple variants.

### Usage

To display a tone, initialize the view with an instance of ``SymbolPicker/SPEmoji/Skin``:

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

The view optimizes emoji rendering by using a high base font size and a minimum scale factor. This ensures the emoji fits its frame while staying sharp. It also enforces a single-line layout to keep the UI consistent.

### Platform and OS Awareness

If a skin tone is unavailable on the current OS, the view displays a placeholder. It checks availability via ``SymbolPicker/SPEmoji/Skin/isAvailable()`` before rendering. 

### Performance and Accessibility

GPU-accelerated rendering through `.drawingGroup()` keeps performance smooth during scrolling, even with many variants on screen. The view inherits accessibility behavior from the underlying emoji model, ensuring it works with high-contrast and large-text modes.

## Topics

### Initialization

- ``SymbolPicker/SPEmojiSkinView/init(skin:)``
