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

This initializer provides a way to create an image selection with an optional SwiftUI color applied as a tint or background color.

### Selection State

When using this initializer:
- The ``SymbolPicker/SPSelection/type`` is set to ``SymbolPicker/SPSelection/SelectionType/image``.
- The ``SymbolPicker/SPSelection/image`` property is populated with the provided asset.

### Color Handling

The provided SwiftUI `Color` is automatically converted into a `ColorKit/CKColor` for storage. This color is typically used as a tint or background fill for the image selection.
