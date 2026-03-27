# ``SymbolPicker/SPSymbol/Variant/filled``

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

The solid version of an SF Symbol.

## Overview

The `filled` case maps to system names that end in `.fill`, such as `"heart.fill"`.

### Appearance

Filled symbols have a stronger visual presence. They work well for:
- **Active States**: Showing a selected tab or an active toggle.
- **Emphasis**: Drawing attention to a specific status.
- **Legibility**: Improving visibility on textured backgrounds where thin lines might disappear.

When you apply this case, the library uses the `filledName` property to display the solid variant.
