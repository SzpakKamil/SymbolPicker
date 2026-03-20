# ``SymbolPicker/SPSymbol/name(for:)``

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

Retrieves the SF Symbol system name for a specific visual variant.

## Overview

The `name(for:)` method is a utility for resolving the appropriate system name string based on a provided ``SymbolPicker/SPSymbol/Variant``.

### Selection Mapping

This method provides a direct mapping from a variant enum case to the corresponding string property:
- `.filled`: Returns the value of `filledName`.
- `.outlined`: Returns the value of `notFilled`.

### Decoupling Logic

By using this method, the rest of the library (and any consumer code) is decoupled from the specific naming conventions of SF Symbols. Instead of manually appending or removing suffixes like `.fill`, developers can rely on this method to provide the correct string for the desired visual style.

### Returns

- A `String` representing the system name of the symbol for the requested variant.
