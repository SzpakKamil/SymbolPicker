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

Sets the rendering variant applied to SF Symbols displayed in the picker.

## Overview

Use this modifier to control how SF Symbols are rendered — for example, using hierarchical, palette, or multicolor variants to match your app's visual style.

### Example

Display symbols using the hierarchical rendering variant:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spSymbolsVariant(.hierarchical)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `variant` | ``SymbolPicker/SPSymbol/Variant`` | The rendering variant to apply to the displayed SF Symbols. |
