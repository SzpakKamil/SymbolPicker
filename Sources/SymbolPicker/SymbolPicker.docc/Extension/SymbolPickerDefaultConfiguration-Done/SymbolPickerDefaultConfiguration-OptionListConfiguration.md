# ``SymbolPicker/SymbolPickerDefaultConfiguration/optionListConfiguration()``

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

Resolves the configuration for the asset grid.

## Overview

This method implements the ``SymbolPicker/SymbolPickerConfiguration/optionListConfiguration()`` protocol requirement by calling ``SymbolPicker/SymbolPickerDefaultConfiguration/currentOptionListConfiguration`` with the active ``SymbolPicker/SymbolPickerDefaultConfiguration/displayStyle``.

### Return Value

Returns an ``SymbolPicker/SPOptionListConfiguration`` that defines the grid's cell spacing, padding, and interactive styling.
