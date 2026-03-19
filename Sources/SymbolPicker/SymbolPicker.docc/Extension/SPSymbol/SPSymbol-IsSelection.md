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

Determines if this symbol is functionally identical to another symbol instance.

## Overview

The `isSelection(of:)` method provides a robust way to check for equality between symbol instances. Unlike a simple object or string comparison, it account for the fact that a single symbol concept can be represented by multiple system names (filled and outlined).

### Equivalence Logic

A symbol is considered a selection of another if their core identifiers match. Internally, this often means checking the `filledName` of the current instance against both the `filledName` and `notFilled` properties of the target symbol.

### Importance in UI

This method is essential for the picker's selection highlighting. It allows the UI to maintain a "selected" state even when:
- The global variant is toggled by the user.
- The symbol is loaded from a different data source but represents the same SF Symbol.

### Returns

- `true` if the symbols represent the same underlying SF Symbol; otherwise, `false`.
