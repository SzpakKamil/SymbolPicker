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

A "Quick" initializer for symbols where filled and outlined names are identical.

- Parameter systemName: The SF Symbol system name to use for both filled and outlined variants.

## Overview

This initializer provides a convenient way to create an ``SymbolPicker/SPSymbol`` when the symbol does not have distinct "filled" and "outlined" variants, or when such distinction is not required.

### Default Values

When using this initializer:
- `filledName` and `notFilled` are both set to the provided `systemName`.
- `id` is set to `systemName`.
- `version` defaults to `1.0`.
- All other metadata properties (`category`, `subcategory`, `tags`, `annotation`) are set to `nil`.

### Use Cases

This is ideal for quickly creating symbol objects for testing or for simple symbols that do not follow the standard SF Symbol variant naming conventions.
