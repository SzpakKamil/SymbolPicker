# ``SymbolPicker/SymbolPickerModifier/spOptionListCornerRadiusFactor(_:)``

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

Sets the corner radius multiplier for the asset cells in the presented picker's grid.

## Overview

Use this modifier to customize the roundness of the icons and emojis displayed in the grid.

### Example

Make the asset cells more rounded:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spOptionListCornerRadiusFactor(2.0)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `CGFloat` | The multiplier for the cell's corner radius. |
