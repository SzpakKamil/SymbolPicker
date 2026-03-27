# ``SymbolPicker/SymbolPickerDefaultConfiguration/selectionPreviewConfiguration()``

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

Resolves the configuration for the selection preview.

## Overview

This method fulfills the ``SymbolPicker/SymbolPickerConfiguration/selectionPreviewConfiguration()`` requirement. It calls the ``SymbolPicker/SymbolPickerDefaultConfiguration/currentSelectionPreviewConfiguration`` closure with the active ``SymbolPicker/SymbolPickerDefaultConfiguration/displayStyle``.

### Return Value

Returns an ``SymbolPicker/SPSelectionPreviewConfiguration`` that sets the preview card's corner radius and scroll animations.
