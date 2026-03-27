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

Initialize a selection with a pure color. This initializer lets `SymbolPicker` act as a standalone color picker. 

### Selection State

When you use this initializer, it sets the selection ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/color``. It populates the ``SymbolPicker/SPSelection/color`` property with your value. Other asset properties, like symbols or emojis, stay `nil`.

### Rendering Behavior

Because this is a pure color selection, the ``SymbolPicker/SPSelection/asView()`` method displays it as a circular fill. This ensures the selection remains visually distinct even without an associated icon or image.
