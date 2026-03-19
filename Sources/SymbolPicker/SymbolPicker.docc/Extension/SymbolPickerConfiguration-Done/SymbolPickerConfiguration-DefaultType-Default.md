# ``SymbolPicker/SymbolPickerConfiguration/defaultType-2ngdh``

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


The ``SymbolPicker/SPPageType`` asset type that is selected when the picker first opens.

## Overview

The `defaultType` property defines which tab or asset type is initially displayed to the user. It must be one of the types defined in the ``SymbolPicker/SymbolPickerConfiguration/supportedTypes`` property.

### Customization

```swift
var defaultType: SPPageType = .emoji
```
