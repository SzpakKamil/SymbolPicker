# ``SymbolPicker/SymbolPickerConfiguration/optionList``

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

Accesses the main asset list configuration.

## Overview

The `optionList` property is a convenience shortcut for calling ``SymbolPicker/SymbolPickerConfiguration/optionListConfiguration()``.

### Implementation

It works as a simple wrapper:
```swift
var optionList: SPOptionListConfiguration { optionListConfiguration() }
```

Use this property to read settings for the asset grid, such as item colors, padding, or corner radii.
