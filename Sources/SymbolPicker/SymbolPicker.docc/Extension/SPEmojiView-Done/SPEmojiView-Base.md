# ``SymbolPicker/SPEmojiView``

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

A specialized view for rendering localized emojis with support for dynamic scaling and availability fallbacks.

## Overview

`SPEmojiView` is a text-based rendering component designed to display emojis within the ``SymbolPicker`` package. It manages the complexities of emoji representation, ensuring that icons are crisp, legible, and properly handled across different operating system versions.

### Usage

To use `SPEmojiView`, initialize it with an instance of ``SymbolPicker/SPEmoji``:

```swift
import SwiftUI
import SymbolPicker

struct MyEmojiPreview: View {
    // Using the string initializer
    let emoji = SPEmoji("😀")

    var body: some View {
        SPEmojiView(emoji: emoji)
            .frame(width: 44, height: 44)
    }
}
```

### High-Fidelity Rendering

The view uses standard SwiftUI `Text` components but optimizes them for large-scale previews:
- **Maximum Scale**: The view is initialized with a high base font size (e.g., `300`). 
- **Dynamic Scaling**: It uses `.minimumScaleFactor(0.01)` to ensure that the emoji automatically scales down to fit within its containing frame, providing a crisp rendering at any size.
- **Single-Line Layout**: Enforces a single-line limit to maintain the visual integrity of the emoji.

### Platform and OS Awareness

Emoji support varies by OS version. `SPEmojiView` intelligently handles cases where a specific emoji might not be supported on the current platform:
- **Automatic Fallback**: If an ``SymbolPicker/SPEmoji`` is flagged as unavailable on the current system, the view automatically displays a standardized "question mark" symbol instead.
- **Skin Tone Variation**: While the base `SPEmojiView` renders the primary emoji, it integrates with the overall emoji picker to support skin tone selection through ``SymbolPicker/SPEmoji/Skin``.

### Accessibility

`SPEmojiView` provides automatic localization for screen readers. It utilizes the annotation property of the underlying ``SymbolPicker/SPEmoji`` model to provide descriptive accessibility labels (via ``SymbolPicker/SPPageType/emoji``), making the emoji library accessible to all users.

### Rendering Performance

To maintain a high frame rate, especially when rendering many high-resolution emojis, `SPEmojiView` uses the `.drawingGroup()` modifier. This approach leverages GPU-accelerated rendering, which is particularly effective for text-based icons that need to scale dynamically without losing clarity.

## Topics

### Initialization

- ``SymbolPicker/SPEmojiView/init(emoji:)``
