# ``SymbolPicker/SPSelection/init(image:ckColor:)``

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

Initializes a selection with a custom image and an optional platform-agnostic color.

- Parameters:
  - image: The ``SymbolPicker/SPImage`` to use as the selection.
  - ckColor: An optional `ColorKit/CKColor` to apply as a tint. Defaults to `nil`.

## Overview

Initialize a selection with a custom image and a platform-agnostic color. This initializer lets you create an image selection with a pre-configured `ColorKit/CKColor`.

### Selection State

This method sets the selection ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/image``. It populates the ``SymbolPicker/SPSelection/image`` property with your custom asset.

### Platform Compatibility

By using `ColorKit/CKColor` directly, you ensure the selection's color state works across all supported platforms without further conversion. This is ideal for multi-platform apps where you want consistent color rendering on iOS, macOS, and watchOS.
