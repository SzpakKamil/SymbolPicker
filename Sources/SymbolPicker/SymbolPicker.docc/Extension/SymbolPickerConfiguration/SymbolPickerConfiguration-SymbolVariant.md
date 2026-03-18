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

Defines the ``SymbolPicker/SPSymbol/Variant`` rendering variant used by default in the picker.

## Overview

The `symbolVariant` property dictates whether SF Symbols are displayed in their filled or outlined form by default.

### Available Variants

- **``SymbolPicker/SPSymbol/Variant/filled``**: Uses the filled version of the SF Symbol (e.g., `star.fill`).
- **``SymbolPicker/SPSymbol/Variant/outlined``**: Uses the standard outlined version of the SF Symbol (e.g., `star`).

### Customization

```swift
var symbolVariant: SPSymbol.Variant = .filled
```
