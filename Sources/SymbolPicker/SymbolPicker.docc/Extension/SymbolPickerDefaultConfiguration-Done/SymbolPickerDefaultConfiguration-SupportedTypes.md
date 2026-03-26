# ``SymbolPicker/SymbolPickerDefaultConfiguration/supportedTypes``

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

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

An array of asset categories that the picker is permitted to display.

## Overview

The `supportedTypes` property defines which asset categories (e.g., SF Symbols, Emojis, and User Photos) are available to the user. By default, it contains all available categories: ``SymbolPicker/SPPageType/allCases``.

### Category Switcher

The picker's category switcher (page picker) automatically adjusts based on this property. If only one category is supported, the switcher is hidden to simplify the interface.

### Customization

Restrict the picker to only specific categories.

```swift
var config = SymbolPickerDefaultConfiguration()
config.supportedTypes = [.symbol, .emoji] // Only symbols and emojis
```
