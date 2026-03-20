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

Represents the solid or filled version of an SF Symbol.

## Overview

The `filled` case corresponds to the system names that are typically suffixed with `.fill` (e.g., `"heart.fill"`).

### Visual Appearance

Filled symbols have a stronger visual presence than their outlined counterparts. They are often used in:
- **Active States**: Indicating a selected tab or a toggle that is turned on.
- **High-Emphasis Contexts**: Drawing attention to a specific action or status.
- **Complex Backgrounds**: Improving legibility on varied or textured backgrounds where thin strokes might be lost.

### Selection Resolution

When this case is applied to an `SPSymbol` instance, the library resolves the system name string using the `filledName` property, ensuring that the solid variant is correctly displayed to the user.
