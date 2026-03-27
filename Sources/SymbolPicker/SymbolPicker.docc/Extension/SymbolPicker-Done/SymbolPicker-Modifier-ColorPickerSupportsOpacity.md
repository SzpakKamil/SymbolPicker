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

Enables or disables opacity adjustments in the color picker.

## Overview

When active, an opacity slider appears in the color picker. Users can adjust the transparency of the selected color to create icons with depth or different emphasis levels.

### Features

- **Precise Control**: Adjust the color's alpha component with a slider.
- **Live Updates**: The grid and preview update instantly as you change opacity.
- **Persistence**: The system saves the opacity value in the bound color object.

### Example

Turn on opacity support:

```swift
SymbolPicker(systemImage: $symbolName, color: $iconColor)
    .spColorPickerSupportsOpacity(true)
```

### Parameters

- **value**: Set to `true` to enable opacity support.
