# ``SymbolPicker/SymbolPicker/spSymbolsVariant(_:)``

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

Set the visual variant for all SF Symbols in the picker.

## Overview

Control how the picker renders icons by choosing a symbol variant. This ensures the picker's visual style matches the rest of your app.

### Available Variants

- **`.filled`**: Shows the solid version of symbols.
- **`.outlined`**: Shows the thin or stroked version of symbols.

### Example

Apply hierarchical rendering to add depth to your icons:

```swift
SymbolPicker(systemImage: $symbolName)
    .spSymbolsVariant(.outlined)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `variant` | ``SymbolPicker/SPSymbol/Variant`` | The rendering style you want to apply. |
