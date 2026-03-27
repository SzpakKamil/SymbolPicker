# ``SymbolPicker/SPSymbol/init(systemName:)``

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

Creates a symbol where filled and outlined names match.

- Parameter systemName: The SF Symbol name for both variants.

## Overview

Use this initializer to create an ``SymbolPicker/SPSymbol`` when the icon does not have different "filled" and "outlined" versions.

### Defaults

When you use this initializer:
- **Names**: Sets `filledName` and `notFilled` to the provided `systemName`.
- **Identifier**: Sets `id` to the `systemName`.
- **Version**: Defaults to `1.0`.
- **Metadata**: Sets all other properties to `nil`.

### Usage

This method works well for testing or for simple symbols that do not use standard variant naming.
