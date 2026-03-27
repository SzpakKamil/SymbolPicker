# ``SymbolPicker/SymbolPickerModifier/spPresentationType(_:)``

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

Choose the presentation style for the picker.

## Overview

Select a sheet, popover, or full-screen cover to match your app context. iPhone apps typically use sheets, while iPad and macOS apps often use popovers.

### Example

Present the picker in a popover:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPresentationType(.popover)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | ``SymbolPicker/SPPresentationConfiguration/DisplayType`` | The presentation style. |
