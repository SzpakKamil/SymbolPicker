# ``SymbolPicker/SymbolPickerModifier/spOptionListForegroundPressed(_:)``

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

Sets the foreground color for asset cells in the picker's grid while they are being pressed.

## Overview

Use this modifier to customize the color of icons and emojis during the active press state, providing tactile visual feedback on tap.

### Example

Set a custom pressed foreground color:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spOptionListForegroundPressed(.gray)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Color` | The foreground color applied while a cell is being pressed. |
