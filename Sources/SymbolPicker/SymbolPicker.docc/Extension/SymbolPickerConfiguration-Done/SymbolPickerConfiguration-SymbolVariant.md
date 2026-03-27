# ``SymbolPicker/SymbolPickerConfiguration/symbolVariant``

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

The default rendering style for SF Symbols.

## Overview

The `symbolVariant` property sets whether SF Symbols appear in their filled or outlined form by default.

### Variants

- **`.filled`**: Shows the solid version, such as `star.fill`.
- **`.outlined`**: Shows the stroked version, such as `star`.

### Customization

```swift
var symbolVariant: SPSymbol.Variant = .filled
```
