# ``SymbolPicker/SymbolPicker/spDisplayStyle(_:)``

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

Sets the layout strategy for the symbol picker.

## Overview

The display style sets how the picker organizes the grid, search bar, and color palette. Use this to tailor the interface for different screen sizes and platforms.

### Available Styles

- **`.compact`**: A streamlined layout with floating elements. This is the default for iOS 26+ and visionOS. It maximizes the grid area and keeps controls reachable.
- **`.detail`**: A structured sidebar or list-based layout. This is the default for macOS and older iOS versions.
- **`.full`**: A maximized layout that fills the screen. Use this for iPadOS in full-screen or large split-view modes.

### Platform Adaptation

SymbolPicker chooses a default style based on the platform. Use this modifier to override that choice.

### Example

Force the compact style on any device:

```swift
SymbolPicker(systemImage: $symbolName)
    .spDisplayStyle(.compact)
```

### Parameters

- **style**: The ``SymbolPicker/SPDisplayStyle`` to use.
