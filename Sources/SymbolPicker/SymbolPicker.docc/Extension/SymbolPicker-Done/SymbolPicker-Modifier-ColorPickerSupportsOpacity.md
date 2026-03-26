# ``SymbolPicker/SymbolPicker/spColorPickerSupportsOpacity(_:)``

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

Sets whether the integrated color picker supports opacity adjustments.

## Overview

When enabled, an opacity slider is provided within the color selection interface, allowing users to adjust the transparency of the selected color. This is useful for creating icons with varying levels of emphasis or depth.

### Features

- **Granular Control**: Users can adjust the alpha component of the color using a precise slider.
- **Visual Feedback**: The asset grid and selection preview update in real-time to reflect the current opacity setting.
- **Persistence**: The opacity value is stored within the bound color object.

### Example

Enable opacity support for the color picker:

```swift
SymbolPicker(systemImage: $symbolName, color: $iconColor)
    .spColorPickerSupportsOpacity(true)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Bool` | A boolean value that indicates whether opacity support is enabled. |
