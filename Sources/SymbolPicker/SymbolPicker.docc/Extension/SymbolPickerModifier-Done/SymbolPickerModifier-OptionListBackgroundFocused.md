# ``SymbolPicker/SymbolPickerModifier/spOptionListBackgroundFocused(_:)``

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

Sets the background color for asset cells in the picker's grid when they are focused.

## Overview

Use this modifier to customize the cell background when it receives focus via keyboard or game controller navigation.

### Example

Set a custom focused background color:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spOptionListBackgroundFocused(.accentColor.opacity(0.3))
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Color` | The background color applied when a cell is focused. |
