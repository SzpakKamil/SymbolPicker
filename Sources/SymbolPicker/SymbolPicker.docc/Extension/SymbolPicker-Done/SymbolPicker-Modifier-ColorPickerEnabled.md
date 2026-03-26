# ``SymbolPicker/SymbolPicker/spColorPickerEnabled(_:)``

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

Enables or disables the integrated color picker interface.

## Overview

When enabled, a color selection palette is displayed, allowing users to choose a custom color for the selected symbol, emoji, or image. This interface can be further customized using related color picker modifiers to control the palette, layout, and advanced features like opacity.

### Behavior

- **Global Toggle**: This is the primary control for showing the `SPColorPicker` component within the symbol picker.
- **Dynamic Presence**: You can dynamically show or hide the color picker based on the user's current selection or application state.
- **Integration**: The color picker automatically updates the bound color (e.g., `CKColor` or SwiftUI `Color`) provided in the picker's initializer.

### Example

Explicitly enable the color picker for a symbol selection:

```swift
SymbolPicker(systemImage: $symbolName, color: $iconColor)
    .spColorPickerEnabled(true)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Bool` | A boolean value that indicates whether the color picker is enabled. |
