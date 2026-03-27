# ``SymbolPicker/SymbolPickerModifier/spPageTypes(_:defaultType:)-(SPPageType...,_)``

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

Configure asset categories and the default selection using a variadic list.

## Overview

Restrict the picker to specific asset types like SF Symbols or Emojis. This modifier also determines which category users see first when the picker appears.

### Example

Limit the picker to Symbols and Emojis, starting on Symbols:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPageTypes(.symbol, .emoji, defaultType: .symbol)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `types` | `SPPageType...` | A list of supported page types. |
| `defaultType` | ``SymbolPicker/SPPageType`` | The initial page type. |
