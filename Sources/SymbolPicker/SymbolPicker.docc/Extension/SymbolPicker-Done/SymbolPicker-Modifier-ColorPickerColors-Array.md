# ``SymbolPicker/SymbolPicker/spColorPickerColors(_:)-([CKColor])``

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


Sets the available colors in the color picker using an array of `CKColor` objects.

## Overview

Use this modifier to provide a predefined palette of colors for the user to choose from. This is useful for maintaining a consistent color scheme within your application.

### Custom Palette

- **Predefined Options**: You can provide any number of colors to the palette.
- **ColorKit Integration**: Uses the `CKColor` type for advanced color manipulation and platform-agnostic color definitions.
- **Dynamic Updates**: The palette can be updated dynamically if the array changes.

### Example

Provide a custom set of brand colors to the color picker:

```swift
let brandColors: [CKColor] = [.red, .blue, .green, .yellow]

SymbolPicker(systemImage: $symbolName, color: $iconColor)
    .spColorPickerColors(brandColors)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `colors` | `[CKColor]` | An array of colors to display in the palette. |
