# ``SymbolPicker/SymbolPickerDefaultConfiguration/symbolVariant``

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

The default visual style for SF Symbols.

## Overview

The `symbolVariant` property sets how SymbolPicker draws icons. Use this to match the picker's iconography to your app's design language.

### Variants

By default, the picker uses ``SymbolPicker/SPSymbol/Variant/filled``. You can switch to other options like `.outlined`, `.hierarchical`, `.palette`, or `.monochrome`.

### Customization

```swift
var config = SymbolPickerDefaultConfiguration()
config.symbolVariant = .outlined // Use outlined rendering
```
