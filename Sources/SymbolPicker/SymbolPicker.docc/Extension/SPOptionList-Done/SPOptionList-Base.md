# ``SymbolPicker/SPOptionList``

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

You browse and select symbols or emojis in this adaptive grid.

## Overview

`SPOptionList` is the core browsing component of the `SymbolPicker`. It provides an adaptive grid that scales icons based on your screen width and dynamic type size.

### Key Capabilities

- **Dynamic Grid Sizing**: The grid ensures icons remain large enough to tap at any text size, from `small` to the largest accessibility settings.
- **Generic Data Handling**: You can use this list with any asset type that follows the ``SymbolPicker/SPDataAsset`` protocol.
- **Platform Selection**: It handles single taps for selection and offers a long-press skin tone picker for emojis.
- **Sectioned Layout**: The list automatically groups assets into categories like "Nature" or "Activity" to help users navigate.

### Configuration-Driven Styling

The grid's look—including colors, padding, and corner radius—comes from the ``SymbolPicker/SPOptionListConfiguration``. This lets you customize the picker's aesthetic without touching the internal view code.

### Integration

To use `SPOptionList`, provide a binding to an ``SymbolPicker/SPSelection`` object. The view resolves the asset type and builds the appropriate grid.

```swift
SPOptionList(selection: $selection)
```

## Topics

### Initialization

- ``SymbolPicker/SPOptionList/init(selection:)``

### Supporting Types

- ``SymbolPicker/SPOptionListConfiguration``
