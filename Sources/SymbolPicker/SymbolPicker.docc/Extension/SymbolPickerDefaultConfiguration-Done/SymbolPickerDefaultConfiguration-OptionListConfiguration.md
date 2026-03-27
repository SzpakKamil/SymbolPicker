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

This method fulfills the ``SymbolPicker/SymbolPickerConfiguration/optionListConfiguration()`` requirement. It calls the ``SymbolPicker/SymbolPickerDefaultConfiguration/currentOptionListConfiguration`` closure with the active style.

### Return Value

Returns an ``SymbolPicker/SPOptionListConfiguration`` that defines the grid's cell rounding, padding, and interactive colors.
