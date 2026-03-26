# ``SymbolPicker/SymbolPickerModifier/spColorPickerSupportsCustomColor(_:)``

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

Sets whether the integrated color picker supports selecting arbitrary custom colors.

## Overview

When enabled, a system color well or "plus" button is provided to open the platform's standard color picker for selecting any color beyond the predefined palette.

### Example

Enable custom color selection:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spColorPickerSupportsCustomColor(true)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Bool` | A Boolean value that indicates whether custom color selection is enabled. |
