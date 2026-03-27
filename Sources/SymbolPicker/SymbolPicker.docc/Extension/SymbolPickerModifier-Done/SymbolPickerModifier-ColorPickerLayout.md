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

Set the orientation and spacing of the integrated color picker palette.

## Overview

Control whether the color palette appears horizontally or vertically. You can also adjust the space between color swatches to fit your design.

### Example

Force a vertical palette with 10-point spacing:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spColorPickerLayout(.vertical, spacing: 10)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `type` | ``SymbolPicker/SPColorPickerConfiguration/Direction`` | The palette orientation (`.horizontal` or `.vertical`). |
| `spacing` | `CGFloat?` | The space between color swatches. |
