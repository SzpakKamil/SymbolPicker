# ``SymbolPicker/SPSymbol/Variant/outlined``

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

Represents the standard stroked or outlined version of an SF Symbol.

## Overview

The `outlined` case corresponds to the standard, non-filled system names (e.g., `"heart"`). This is the default visual style for most symbols in the library.

### Visual Appearance

Outlined symbols have a lighter, more minimalist visual presence. They are commonly used in:
- **Inactive States**: Representing a tab or an option that is currently not selected.
- **Low-Emphasis Contexts**: Providing iconographic support without distracting from primary content.
- **Information Density**: Allowing for more complex layouts by reducing visual weight.

### Selection Resolution

When this case is applied to an `SPSymbol` instance, the library resolves the system name string using the `notFilled` property, ensuring that the stroked variant is correctly displayed.
