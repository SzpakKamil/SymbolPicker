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

Toggle the drag indicator on the presented picker surface.

## Overview

Show or hide the grabber at the top of the sheet. This indicator helps users understand that they can swipe to dismiss or resize the picker.

### Example

Show the drag indicator:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPresentationDragIndicator(.visible)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Visibility` | Toggle for drag indicator visibility. |
