# ``SymbolPicker/SPSelection/init(emoji:ckColor:)``

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

Initializes a selection with an emoji and an optional platform-agnostic color.

- Parameters:
  - emoji: The ``SymbolPicker/SPEmoji`` to use as the selection.
  - ckColor: An optional `ColorKit/CKColor` to apply as a tint. Defaults to `nil`.

## Overview

This initializer provides a direct way to create an emoji selection with a pre-configured `ColorKit/CKColor`.

### Selection State

When using this initializer:
- The ``SymbolPicker/SPSelection/type`` is set to ``SymbolPicker/SPSelection/SelectionType/emoji``.
- The ``SymbolPicker/SPSelection/emoji`` property is populated with the provided character data.

### Direct Color Storage

By using `ColorKit/CKColor` directly, this initializer ensures that the selection's color state is ready for use across all supported platforms without further conversion.
