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

This initializer allows you to create an emoji selection and optionally apply a SwiftUI color as a tint or background color.

### Selection State

When using this initializer:
- The ``SymbolPicker/SPSelection/type`` is set to ``SymbolPicker/SPSelection/SelectionType/emoji``.
- The ``SymbolPicker/SPSelection/emoji`` property is populated with the provided character data.

### Color Handling

The provided SwiftUI `Color` is automatically converted into a `ColorKit/CKColor` for storage. This color is typically used as a background fill for the circular selection view when the emoji is displayed.
