# ``SymbolPicker/SymbolPickerDefaultConfiguration/defaultType``

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

The initial asset category.

## Overview

The `defaultType` property sets the active page when the picker opens. By default, it uses ``SymbolPicker/SPPageType/symbol`` to show Symbols first.

### Logic

If you bind the picker to a specific asset type like ``SymbolPicker/SPEmoji``, the interface switches to that category automatically. For generic pickers, this property controls the starting tab.

### Customization

```swift
var config = SymbolPickerDefaultConfiguration()
config.defaultType = .emoji // Start with Emojis
```
