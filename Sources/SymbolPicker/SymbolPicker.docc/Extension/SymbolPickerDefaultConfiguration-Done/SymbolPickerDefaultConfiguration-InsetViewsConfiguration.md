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

Resolves the custom inset views for the picker.

## Overview

This method fulfills the ``SymbolPicker/SymbolPickerConfiguration/insetViewsConfiguration()`` requirement. It calls the ``SymbolPicker/SymbolPickerDefaultConfiguration/currentInsetViewConfiguration`` closure using the active style and color picker settings.

### Return Value

Returns an array of ``SymbolPicker/SPInsetedView`` objects. The picker places these into specific toolbar or safe area slots.
