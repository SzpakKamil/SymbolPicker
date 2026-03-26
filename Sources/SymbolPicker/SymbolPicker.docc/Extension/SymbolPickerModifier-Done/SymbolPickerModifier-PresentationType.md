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

Sets how the picker is presented — as a sheet, a popover, or a full-screen cover.

## Overview

Use this modifier to choose the presentation style that best fits your app's context. On iPhone, a sheet is common; on iPad or macOS, a popover is often more appropriate.

### Example

Present the picker as a popover:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPresentationType(.popover)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | ``SymbolPicker/SPPresentationConfiguration/DisplayType`` | The desired presentation style. |
