# ``SymbolPicker/SymbolPickerDefaultConfiguration/colorPickerConfiguration()``

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

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Resolves the configuration for the color selection palette.

## Overview

This method implements the ``SymbolPicker/SymbolPickerConfiguration/colorPickerConfiguration()`` protocol requirement by calling ``SymbolPicker/SymbolPickerDefaultConfiguration/currentColorPickerConfiguration`` with the active ``SymbolPicker/SymbolPickerDefaultConfiguration/displayStyle``.

### Return Value

Returns a ``SymbolPicker/SPColorPickerConfiguration`` or `nil` if the color picker should be hidden.
