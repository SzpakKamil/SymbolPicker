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

A view for rendering emojis with scaling and fallbacks.

## Overview

`SPEmojiView` displays emojis in SymbolPicker. It handles emoji representation to keep icons sharp across different OS versions.

### Usage

Initialize `SPEmojiView` with an ``SymbolPicker/SPEmoji``:

```swift
import SwiftUI
import SymbolPicker

struct MyEmojiPreview: View {
    let emoji = SPEmoji("😀")

    var body: some View {
        SPEmojiView(emoji: emoji)
            .frame(width: 44, height: 44)
    }
}
```

### Rendering

The view uses standard SwiftUI `Text` components optimized for previews:
- **Scaling**: The view uses a high base font size and `.minimumScaleFactor(0.01)` to fit the emoji into its frame.
- **Layout**: It enforces a single-line limit to prevent clipping.

### Platform Support

Emoji support changes with OS updates. `SPEmojiView` handles these cases:
- **Fallbacks**: If the system does not support an emoji, the view shows a "question mark" icon.
- **Variations**: The view integrates with the picker to support skin tone selection via ``SymbolPicker/SPEmoji/Skin``.

### Performance

To keep frame rates high when showing many emojis, `SPEmojiView` uses the `.drawingGroup()` modifier. This lets the GPU handle rendering, keeping the grid responsive during fast scrolling.
