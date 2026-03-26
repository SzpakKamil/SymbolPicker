# ``SymbolPicker/SymbolPickerModifier/spPresentationCornerRadius(_:)``

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

Sets the corner radius for the presented picker's surface.

## Overview

Use this modifier to customize the roundness of the corners of the sheet or popover that contains the symbol picker.

### Example

Make the picker's corners more rounded:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPresentationCornerRadius(30)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `CGFloat` | The desired corner radius for the presentation surface. |
