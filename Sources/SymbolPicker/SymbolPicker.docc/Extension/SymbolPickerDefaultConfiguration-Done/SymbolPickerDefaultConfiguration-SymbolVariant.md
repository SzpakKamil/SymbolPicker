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

The visual rendering style applied to all SF Symbols within the picker.

## Overview

The `symbolVariant` property controls how SF Symbols are drawn. This is useful for maintaining a consistent iconography style throughout your application.

### Available Variants

By default, this is set to ``SymbolPicker/SPSymbol/Variant/filled``. Other common options include `.hierarchical`, `.palette`, `.monochrome`, and `.outlined`.

### Customization

Change the variant to match your application's design language.

```swift
var config = SymbolPickerDefaultConfiguration()
config.symbolVariant = .hierarchical // Use hierarchical rendering
```
