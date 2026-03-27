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

The asset types available in the picker.

## Overview

The `supportedTypes` property sets which categories appear as tabs. You can limit the picker to specific assets, such as showing only symbols or hiding custom images.

### Available Types

- **`.symbol`**: Symbols.
- **`.emoji`**: System emojis.
- **`.image`**: User photos from the library.

### Customization

```swift
var supportedTypes: [SPPageType] = [.symbol, .emoji]
```
