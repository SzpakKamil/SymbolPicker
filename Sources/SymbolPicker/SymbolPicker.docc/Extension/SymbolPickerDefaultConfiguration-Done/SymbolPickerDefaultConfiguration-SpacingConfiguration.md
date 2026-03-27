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

Resolves the layout spacings for the picker.

## Overview

This method fulfills the ``SymbolPicker/SymbolPickerConfiguration/spacingConfiguration()`` requirement. It calls the ``SymbolPicker/SymbolPickerDefaultConfiguration/currentSpacingConfiguration`` closure with the active ``SymbolPicker/SymbolPickerDefaultConfiguration/displayStyle``.

### Return Value

Returns an array of ``SymbolPicker/SPSpacing`` objects. These objects set the gaps between the picker's visual blocks, ensuring a balanced layout.
