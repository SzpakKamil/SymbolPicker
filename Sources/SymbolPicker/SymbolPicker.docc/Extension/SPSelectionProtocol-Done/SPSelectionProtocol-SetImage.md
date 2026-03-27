# ``SymbolPicker/SPSelectionProtocol/setImage(_:)``

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

Updates the image for the selection.

- Parameter image: The new ``SymbolPicker/SPImage`` object.

## Overview

The `setImage(_:)` method updates the user-provided photo choice. As a `mutating` requirement, it changes the internal state of types like ``SymbolPicker/SPSelection``.

### Details

This method runs when users pick a photo or adjust the crop and zoom. Setting a new image triggers a re-render of dependent UI components, updating the preview area instantly.
