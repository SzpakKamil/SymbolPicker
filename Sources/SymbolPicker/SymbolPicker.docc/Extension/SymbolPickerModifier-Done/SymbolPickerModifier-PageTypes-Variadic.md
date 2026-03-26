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

Configures the supported asset categories and the default selected category using a variadic list.

## Overview

Use this modifier to restrict the presented picker to specific types of assets, such as only SF Symbols or only Emojis.

### Example

Restrict the picker to Symbols and Emojis:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPageTypes(.symbol, .emoji, defaultType: .symbol)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `types` | `SPPageType...` | A variadic list of supported page types. |
| `defaultType` | ``SymbolPicker/SPPageType`` | The page type to display initially. |
