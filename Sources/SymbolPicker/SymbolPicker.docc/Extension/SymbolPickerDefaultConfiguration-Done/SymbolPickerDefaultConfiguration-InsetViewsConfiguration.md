# ``SymbolPicker/SymbolPickerDefaultConfiguration/insetViewsConfiguration()``

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

Resolves the custom inseted views for the picker.

## Overview

This method implements the ``SymbolPicker/SymbolPickerConfiguration/insetViewsConfiguration()`` protocol requirement by calling ``SymbolPicker/SymbolPickerDefaultConfiguration/currentInsetViewConfiguration`` with the active ``SymbolPicker/SymbolPickerDefaultConfiguration/displayStyle`` and ``SymbolPicker/SymbolPickerConfiguration/colorPicker``.

### Return Value

Returns an array of ``SymbolPicker/SPInsetedView`` objects that are placed into predefined toolbar or safe area slots.
