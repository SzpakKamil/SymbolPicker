# ``SymbolPicker/SymbolPickerDefaultConfiguration/presentationConfiguration()``

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

Resolves the presentation configuration by invoking the corresponding closure.

## Overview

This method implements the ``SymbolPicker/SymbolPickerConfiguration/presentationConfiguration()`` protocol requirement by calling ``SymbolPicker/SymbolPickerDefaultConfiguration/currentPresentationConfiguration`` with the active ``SymbolPicker/SymbolPickerDefaultConfiguration/displayStyle``.

### Return Value

Returns a ``SymbolPicker/SPPresentationConfiguration`` that dictates whether the picker appears as a sheet, popover, or full-screen cover.
