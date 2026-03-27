# ``SymbolPicker/SPSymbol/isDuplicate(of:)``

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

Compares two symbols by name.

- Parameter other: The symbol to compare.
- Returns: `true` if the symbols share the same `filledName` and `notFilled` names.

## Overview

The `isDuplicate(of:)` method prevents the picker from showing the same symbol multiple times during data loading.

### Redundancy

SF Symbols may appear multiple times in raw data or localized files. This method identifies these duplicates by checking the core names.

### Usage

``SymbolPicker/SPSymbol/fetchAssets(locale:)`` uses this method to filter the array. This ensures the user sees a clean list of unique icons.
