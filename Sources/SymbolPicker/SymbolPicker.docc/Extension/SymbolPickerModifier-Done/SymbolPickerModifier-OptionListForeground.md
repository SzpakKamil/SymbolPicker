# ``SymbolPicker/SymbolPickerModifier/spOptionListForeground(_:)``

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

Sets the foreground color for the asset cells in the presented picker's grid.

## Overview

Use this modifier to customize the base color of the icons and emojis displayed in the grid.

### Example

Set the asset icons to a custom color:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spOptionListForeground(.blue)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Color` | The desired foreground color. |
