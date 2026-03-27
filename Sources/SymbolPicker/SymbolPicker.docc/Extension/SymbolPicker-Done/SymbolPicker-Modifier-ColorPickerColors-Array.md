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

Sets the available colors in the color picker.

## Overview

Use this modifier to provide a palette of colors for the user. It helps maintain a consistent color scheme in your app.

### Custom Palette

- **Predefined Options**: Provide any number of colors to the palette.
- **ColorKit Integration**: Uses `CKColor` for platform-agnostic definitions.
- **Dynamic Updates**: The palette updates if the array changes.

### Example

Set brand colors for the picker:

```swift
let brandColors: [CKColor] = [.red, .blue, .green, .yellow]

SymbolPicker(systemImage: $symbolName, color: $iconColor)
    .spColorPickerColors(brandColors)
```

### Parameters

- **colors**: An array of `CKColor` objects to show in the palette.
