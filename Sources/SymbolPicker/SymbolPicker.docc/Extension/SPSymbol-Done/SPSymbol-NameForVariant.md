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

Resolves the system name for a visual variant.

- Parameter variant: The desired ``SymbolPicker/SPSymbol/Variant``.
- Returns: The SF Symbol name string.

## Overview

The `name(for:)` method returns the correct system name based on the provided variant.

### Mapping

This method maps variant cases to their string properties:
- **`.filled`**: Returns the `filledName` value.
- **`.outlined`**: Returns the `notFilled` value.

### Benefits

This utility decouples your code from SF Symbol naming conventions. Instead of manually adding or removing `.fill` suffixes, you use this method to get the correct string for any visual style.
