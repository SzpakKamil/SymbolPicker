# ``SymbolPicker/SPSymbol/Variant``

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

Visual styles for SF Symbols.

## Overview

The `Variant` enum switches between the two primary visual styles for SF Symbols: filled and outlined. This abstraction provides a consistent way to manage icon styles across the library and your UI.

### Logic

Instead of manually appending `.fill` to system names, this enumeration tracks the visual state. Use it to:
- **Style Globally**: Apply a consistent look to all icons in the picker.
- **Preview Styles**: Let users toggle between variants in real-time.
- **Ensure Safety**: Request only valid visual states from an `SPSymbol` instance.

### Platform Support

As a core part of the symbol system, `Variant` works on every platform. It ensures a unified API for managing symbol styles on iOS, macOS, and visionOS.

## Topics

### Style Cases

- ``SymbolPicker/SPSymbol/Variant/filled``
- ``SymbolPicker/SPSymbol/Variant/outlined``

### Instance Properties

- ``SymbolPicker/SPSymbol/Variant/id``
