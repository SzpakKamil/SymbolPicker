# ``SymbolPicker/SPSelection/getEmoji()``

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

Returns the emoji character data for the selection.

- Returns: The ``SymbolPicker/SPEmoji`` assigned to the selection, or `nil` if the selection type is not `.emoji`.

## Overview

The `getEmoji()` method provides safe access to the underlying emoji character and skin tone data. It ensures that you only receive an emoji asset if the selection ``SymbolPicker/SPSelection/type`` is currently set to `.emoji`.

### Usage in Custom Rendering

This method is useful when you want to handle the rendering of a selected emoji manually, for example by applying custom fonts or animations that are specific to your app's design.
