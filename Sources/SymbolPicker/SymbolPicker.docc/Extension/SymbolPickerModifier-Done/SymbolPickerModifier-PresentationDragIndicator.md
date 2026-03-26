# ``SymbolPicker/SymbolPickerModifier/spPresentationDragIndicator(_:)``

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

Sets the visibility of the drag indicator on the presented picker's surface.

## Overview

Use this modifier to show or hide the grabber (drag indicator) at the top of the sheet when the picker is presented.

### Example

Explicitly show the drag indicator:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPresentationDragIndicator(.visible)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Visibility` | The desired visibility of the drag indicator. |
