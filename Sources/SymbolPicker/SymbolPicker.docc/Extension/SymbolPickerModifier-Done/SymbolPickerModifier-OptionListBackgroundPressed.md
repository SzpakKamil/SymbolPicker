# ``SymbolPicker/SymbolPickerModifier/spOptionListBackgroundPressed(_:)``

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

Sets the background color for asset cells in the picker's grid while they are being pressed.

## Overview

Use this modifier to provide visual feedback during a tap by applying a custom background color to a cell in its active press state.

### Example

Set a custom pressed background color:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spOptionListBackgroundPressed(.secondary.opacity(0.3))
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Color` | The background color applied while a cell is being pressed. |
