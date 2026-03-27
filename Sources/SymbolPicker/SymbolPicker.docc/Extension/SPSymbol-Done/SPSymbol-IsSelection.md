# ``SymbolPicker/SPSymbol/isSelection(of:)``

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

Checks if this symbol represents the same asset as another instance.

- Parameter symbol: The symbol to compare.
- Returns: `true` if the symbols represent the same SF Symbol.

## Overview

The `isSelection(of:)` method checks for equality between symbol instances. It accounts for the fact that a single symbol concept often has multiple system names, such as filled and outlined versions.

### Logic

A symbol matches another if their core identifiers align. The method checks the current instance's `filledName` against both the `filledName` and `notFilled` properties of the target symbol.

### Usage

This check is vital for highlighting selections in the UI. It maintains the "selected" state even when:
- You toggle the global variant between filled and outlined.
- You load the symbol from a different data source that represents the same SF Symbol.
