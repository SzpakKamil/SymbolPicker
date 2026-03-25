# ``SymbolPicker/SPSelection/getImage()``

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

Returns the custom image asset for the selection.

- Returns: The ``SymbolPicker/SPImage`` assigned to the selection, or `nil` if the selection type is not `.image`.

## Overview

The `getImage()` method provides safe access to the underlying image data. It ensures that you only receive an image asset if the selection ``SymbolPicker/SPSelection/type`` is currently set to `.image`.

### Usage in Custom Rendering

This method is useful when you want to handle the rendering of a selected image manually, for example by applying custom filters or animations that are specific to your app's design.
