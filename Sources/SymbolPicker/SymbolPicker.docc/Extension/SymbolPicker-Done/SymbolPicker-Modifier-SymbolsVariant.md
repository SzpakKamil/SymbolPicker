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

Sets the visual variant for all SF Symbols displayed within the picker.

## Overview

The symbol variant determines the rendering style of the icons. This allows you to maintain visual consistency with the rest of your application's design language.

### Available Variants

- **`.monochrome`**: The standard, single-color rendering style for symbols.
- **`.hierarchical`**: A multi-layered rendering style that uses varying opacities of a single color to add depth and emphasis.
- **`.palette`**: A multi-color rendering style where different layers of the symbol can be assigned distinct colors.
- **`.multicolor`**: Uses the built-in multicolor definitions provided by SF Symbols for icons like weather or battery indicators.
- **`.filled`**: Primarily displays the filled versions of symbols (the default).
- **`.outlined`**: Primarily displays the outlined or thin versions of symbols.

### Example

Set the symbol variant to use hierarchical rendering for more visual depth:

```swift
SymbolPicker(systemImage: $symbolName)
    .spSymbolsVariant(.hierarchical)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `variant` | ``SymbolPicker/SPSymbol/Variant`` | The symbol variant to apply. |
