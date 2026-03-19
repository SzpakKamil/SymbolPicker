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

Compares two symbols by their names to avoid redundancy during the loading process.

- Parameter other: The other symbol to compare with.
- Returns: `true` if the symbols have the same `filledName` and `notFilled` names; otherwise, `false`.

## Overview

The `isDuplicate(of:)` method is used during the data ingestion process to ensure that the picker does not display the same symbol multiple times.

### Redundancy Prevention

SF Symbols might sometimes be listed multiple times in raw data sources or across different localized files. This method provides a reliable way to identify these duplicates by comparing the core identity of the symbol: its filled and outlined system names.

### Usage in Data Loading

When symbols are fetched using ``SymbolPicker/SPSymbol/fetchAssets(locale:)``, this method can be used to filter the resulting array, ensuring that the final list presented to the user is clean and free of redundant entries.
