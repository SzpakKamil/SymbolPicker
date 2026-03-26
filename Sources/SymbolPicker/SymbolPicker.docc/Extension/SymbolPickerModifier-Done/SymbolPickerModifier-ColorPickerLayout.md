# ``SymbolPicker/SymbolPickerModifier/spColorPickerLayout(_:spacing:)``

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

Sets the orientation and spacing of the integrated color picker palette.

## Overview

Use this modifier to control whether the color palette is displayed horizontally or vertically and to adjust the spacing between color swatches.

### Example

Force a vertical color palette with custom spacing:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spColorPickerLayout(.vertical, spacing: 10)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `type` | ``SymbolPicker/SPColorPickerConfiguration/Direction`` | The orientation of the palette (`.horizontal` or `.vertical`). |
| `spacing` | `CGFloat?` | The spacing between color swatches. |
