# ``SymbolPicker/SPSelection/init(emoji:color:)``

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

Initializes a selection with an emoji and an optional SwiftUI color.

- Parameters:
  - emoji: The ``SymbolPicker/SPEmoji`` to use as the selection.
  - color: An optional SwiftUI `Color` to apply as a tint. Defaults to `nil`.

## Overview

Initialize a selection with an emoji and an optional SwiftUI color. You use this to create emoji selections with custom tint or background colors.

### Selection State

This initializer sets the selection ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/emoji``. It populates the ``SymbolPicker/SPSelection/emoji`` property with the provided character data.

### Color Handling

The library converts the SwiftUI `Color` into a `ColorKit/CKColor` for storage. This color often serves as a background fill for the circular selection view when displaying the emoji. This conversion ensures the color remains consistent across all supported platforms.
