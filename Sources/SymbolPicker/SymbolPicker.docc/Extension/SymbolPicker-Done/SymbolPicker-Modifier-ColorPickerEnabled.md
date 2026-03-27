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

Show or hide the integrated color picker.

## Overview

Enable this toggle to display a color selection palette. Users can then choose custom colors for symbols, emojis, or images. You can further refine the palette, layout, and opacity settings using other color picker modifiers.

### Behavior

- **Toggle Control**: Use this as the primary switch for the `SPColorPicker` component.
- **Dynamic Updates**: Show or hide the picker based on the user's current selection or the state of your application.
- **Syncing**: The color picker automatically updates the `CKColor` or `Color` binding you provided during initialization.

### Example

Force the color picker to appear for symbol selection:

```swift
SymbolPicker(systemImage: $symbolName, color: $iconColor)
    .spColorPickerEnabled(true)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Bool` | Set to `true` to show the color picker; `false` to hide it. |
