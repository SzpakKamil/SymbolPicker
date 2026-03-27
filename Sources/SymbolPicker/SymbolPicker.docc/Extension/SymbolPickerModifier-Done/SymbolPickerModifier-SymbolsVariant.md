# ``SymbolPicker/SymbolPickerModifier/spSymbolsVariant(_:)``

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

Set the rendering variant for SF Symbols in the picker.

## Overview

Control how SF Symbols appear in the grid. You can choose filled or outline variant to align with your app's visual style.

### Example

Render symbols using the hierarchical variant:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spSymbolsVariant(.outlined)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `variant` | ``SymbolPicker/SPSymbol/Variant`` | The SF Symbols rendering variant. |
