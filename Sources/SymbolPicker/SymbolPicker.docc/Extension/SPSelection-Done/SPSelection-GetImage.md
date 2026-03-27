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

Gets the image asset for the selection.

- Returns: The ``SymbolPicker/SPImage`` if the type is `.image`. Otherwise, returns `nil`.

## Overview

The `getImage()` method accesses the underlying image data. It only returns an asset if the selection ``SymbolPicker/SPSelection/type`` is `.image`.

### Custom Rendering

Use this method to render a selected image manually. It allows you to apply filters or animations that match your app's design.
