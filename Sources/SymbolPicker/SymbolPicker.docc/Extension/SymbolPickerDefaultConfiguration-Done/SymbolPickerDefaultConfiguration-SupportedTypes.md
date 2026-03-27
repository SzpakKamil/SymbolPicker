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

The available asset categories.

## Overview

The `supportedTypes` property sets which categories—Symbols, Emojis, or User Photos—appear in the picker. By default, it includes every category in ``SymbolPicker/SPPageType/allCases``.

### Navigation

The category switcher (page picker) adjusts automatically based on this list. If you only support one category, the switcher disappears.

### Customization

```swift
var config = SymbolPickerDefaultConfiguration()
config.supportedTypes = [.symbol, .emoji] // Show only symbols and emojis
```
