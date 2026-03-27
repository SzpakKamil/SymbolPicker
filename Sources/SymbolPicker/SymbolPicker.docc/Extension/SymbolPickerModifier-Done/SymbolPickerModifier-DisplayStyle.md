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

Configure the display style for the presented picker.

## Overview

Choose between a compact list or a spacious grid for the symbol layout. This modifier controls the arrangement of items in the picker.

### Example

Use compact mode for the picker:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spDisplayStyle(.compact)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `style` | ``SymbolPicker/SPDisplayStyle`` | The display style for the picker. |
