# ``SymbolPicker/SymbolPickerDefaultConfiguration/spacingConfiguration()``

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

Resolves the vertical and horizontal spacings for the picker's layout.

## Overview

This method implements the ``SymbolPicker/SymbolPickerConfiguration/spacingConfiguration()`` protocol requirement by calling ``SymbolPicker/SymbolPickerDefaultConfiguration/currentSpacingConfiguration`` with the active ``SymbolPicker/SymbolPickerDefaultConfiguration/displayStyle``.

### Return Value

Returns an array of ``SymbolPicker/SPSpacing`` objects that define the gaps between the picker's major visual blocks.
