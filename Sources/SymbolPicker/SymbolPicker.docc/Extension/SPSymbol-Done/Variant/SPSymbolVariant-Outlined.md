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

The standard stroked version of an SF Symbol.

## Overview

The `outlined` case maps to standard system names like `"heart"`. This is the default style for most icons in the library.

### Appearance

Outlined symbols have a minimalist visual presence. They work best for:
- **Inactive States**: Representing a tab or option that is not selected.
- **Low Emphasis**: Providing icons that do not distract from primary content.
- **Dense Layouts**: Reducing visual weight in complex interfaces.

When you apply this case to an `SPSymbol`, the library uses the `notFilled` property to display the stroked variant.
