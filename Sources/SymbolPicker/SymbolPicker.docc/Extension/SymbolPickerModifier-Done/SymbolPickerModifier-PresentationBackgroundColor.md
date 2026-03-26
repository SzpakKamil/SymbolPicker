# ``SymbolPicker/SymbolPickerModifier/spPresentationBackgroundColor(_:)``

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

Sets the background color for the presented picker's surface.

## Overview

Use this modifier to customize the background color of the sheet, popover, or full-screen cover that contains the symbol picker.

### Example

Set the picker's background color to blue:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPresentationBackgroundColor(.blue.opacity(0.1))
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Color` | The desired background color for the presentation surface. |
