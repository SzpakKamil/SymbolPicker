# ``SymbolPicker/SymbolPickerConfiguration/defaultType``

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

The page type selected when the picker opens.

## Overview

The `defaultType` property sets the initial tab or asset category the user sees. It must match one of the cases in ``SymbolPicker/SymbolPickerConfiguration/supportedTypes``.

### Customization

```swift
var defaultType: SPPageType = .emoji
```
