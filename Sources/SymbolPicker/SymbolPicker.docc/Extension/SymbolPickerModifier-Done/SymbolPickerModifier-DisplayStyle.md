# ``SymbolPicker/SymbolPickerModifier/spDisplayStyle(_:)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.4")
    @Available(iPadOS, introduced: "16.4")
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

Sets the display style of the presented picker.

## Overview

Use this modifier to control how the symbol grid is laid out — for example, whether symbols are shown in a compact list or a spacious grid.

### Example

Present the picker in compact mode:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spDisplayStyle(.compact)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `style` | ``SymbolPicker/SPDisplayStyle`` | The desired display style for the picker. |
