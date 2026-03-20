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

A generic grid/list view for displaying and selecting data assets like symbols, emojis, and images.

## Overview

`SPOptionList` is the primary component for browsing the available symbols and emojis within the `SymbolPicker` package. It provides a highly adaptive grid interface that scales according to the available width and the current dynamic type size.

### Key Capabilities

- **Dynamic Grid Sizing**: Uses an adaptive grid to ensure that cells remain legible across all dynamic type sizes, from `small` to `accessibilityExtraExtraExtraLarge`.
- **Generic Data Handling**: Works seamlessly with any asset type that conforms to ``SymbolPicker/SPDataAsset``. 
- **Platform-Optimized Selection**: Handles single-tap selection and provides a long-press skin tone picker for emojis on supported platforms.
- **Sectioned Layout**: Automatically organizes assets into logical groups (e.g., categories) for easier navigation.

### Configuration-Driven Styling

The visual appearance of the grid items—including colors, padding, and corner radii—is governed by the ``SymbolPicker/SPOptionListConfiguration``. This configuration is resolved from the environment, allowing for deep customization of the picker's aesthetic without modifying the underlying view logic.

### Integration

To use `SPOptionList`, you simply provide a binding to an ``SymbolPicker/SPSelection`` object. The view will automatically resolve the asset type and render the appropriate grid.

```swift
SPOptionList(selection: $selection)
```

## Topics

### Initialization

- ``SymbolPicker/SPOptionList/init(selection:)``

### Supporting Types

- ``SymbolPicker/SPOptionListConfiguration``
