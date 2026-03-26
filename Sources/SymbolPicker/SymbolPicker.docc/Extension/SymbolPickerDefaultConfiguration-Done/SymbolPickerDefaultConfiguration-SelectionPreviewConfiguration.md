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

Resolves the configuration for the selection preview card.

## Overview

This method implements the ``SymbolPicker/SymbolPickerConfiguration/selectionPreviewConfiguration()`` protocol requirement by calling ``SymbolPicker/SymbolPickerDefaultConfiguration/currentSelectionPreviewConfiguration`` with the active ``SymbolPicker/SymbolPickerDefaultConfiguration/displayStyle``.

### Return Value

Returns a ``SymbolPicker/SPSelectionPreviewConfiguration`` that governs the preview card's corner radius and scrolling animations.
