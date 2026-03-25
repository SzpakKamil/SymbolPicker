# ``SymbolPicker/SPSelection/init(value:)``

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

Initializes a selection with a pure color value.

- Parameter value: The `ColorKit/CKColor` to use as the selection.

## Overview

This initializer creates a color-only selection, allowing the ``SymbolPicker`` to act as a pure color picker.

### Selection State

When using this initializer:
- The ``SymbolPicker/SPSelection/type`` is set to ``SymbolPicker/SPSelection/SelectionType/color``.
- The ``SymbolPicker/SPSelection/color`` property is populated with the provided value.
- Other asset properties (symbol, emoji, image) remain `nil`.

### Asset Logic

Because this is a pure color selection, the ``SymbolPicker/SPSelection/asView()`` method will render this selection as a simple circular fill using the provided color.
