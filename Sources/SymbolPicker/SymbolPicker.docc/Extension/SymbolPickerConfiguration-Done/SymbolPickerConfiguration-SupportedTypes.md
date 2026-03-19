# ``SymbolPicker/SymbolPickerConfiguration/supportedTypes``

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
}


An array of ``SymbolPicker/SPPageType`` asset types that will be available in the picker.

## Overview

The `supportedTypes` property dictates which categories are presented as tabs in the picker. You can restrict the picker to only show specific types of assets (e.g., only symbols, or both symbols and emojis).

### Available Types

- **``SymbolPicker/SPPageType/symbol``**: Standard SF Symbols.
- **``SymbolPicker/SPPageType/emoji``**: System emojis.
- **``SymbolPicker/SPPageType/image``**: User-selected photos from the library (via PhotosPicker).

### Customization

```swift
var supportedTypes: [SPPageType] = [.symbol, .emoji]
```
