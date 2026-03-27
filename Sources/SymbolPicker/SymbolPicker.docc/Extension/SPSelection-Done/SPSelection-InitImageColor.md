# ``SymbolPicker/SPSelection/init(image:color:)``

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

Initializes a selection with a custom image and an optional SwiftUI color.

- Parameters:
  - image: The ``SymbolPicker/SPImage`` to use as the selection.
  - color: An optional SwiftUI `Color` to apply as a tint. Defaults to `nil`.

## Overview

Initialize a selection with a custom image and an optional SwiftUI color. This initializer lets you apply a tint or background color to an image selection.

### Selection State

This method sets the selection ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/image``. It also populates the ``SymbolPicker/SPSelection/image`` property with your custom asset.

### Color Handling

The library automatically converts the SwiftUI `Color` into a `ColorKit/CKColor` for storage. This color often serves as a tint or background fill, ensuring cross-platform compatibility and visual consistency.
