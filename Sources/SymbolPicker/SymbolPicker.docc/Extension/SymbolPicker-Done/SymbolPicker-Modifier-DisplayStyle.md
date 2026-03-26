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

Sets the display style for the symbol picker, controlling its overall layout strategy.

## Overview

The display style dictates how the picker organizes its internal components, such as the asset grid, search bar, and color palette. This is particularly useful for tailoring the user interface to different platforms and screen sizes.

### Available Styles

- **`.compact`**: A modern, streamlined layout with floating elements. This is the default style on iOS 26+ and visionOS, focusing on maximizing the grid area while keeping controls easily accessible.
- **`.detail`**: A classic sidebar or list-based layout, providing a more structured and hierarchical view. This is the default on macOS and older iOS versions.
- **`.full`**: A maximized content layout that takes up as much space as possible, ideal for iPadOS in full-screen or large split-view configurations.

### Platform Adaptation

The picker automatically selects an appropriate default style based on the current platform, but this modifier allows you to override that behavior for specific use cases.

### Example

Force a compact display style regardless of the platform:

```swift
SymbolPicker(systemImage: $symbolName)
    .spDisplayStyle(.compact)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `style` | ``SymbolPicker/SPDisplayStyle`` | The desired display style. |
