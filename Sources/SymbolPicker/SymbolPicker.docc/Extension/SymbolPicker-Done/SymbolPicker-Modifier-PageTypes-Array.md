# ``SymbolPicker/SymbolPicker/spPageTypes(_:defaultType:)-([SPPageType],_)``

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

Configures the supported asset categories (page types) and the default selected category using an array.

## Overview

Use this modifier to restrict the picker to specific types of assets, such as only SF Symbols or only Emojis. This is useful for tailoring the picker to the specific data requirements of your application.

### Category Selection

- **Supported Types**: You can include any combination of ``SymbolPicker/SPPageType/symbol``, ``SymbolPicker/SPPageType/emoji``, and ``SymbolPicker/SPPageType/image``.
- **Initial Page**: The `defaultType` parameter determines which category is displayed when the picker first appears.
- **UI Feedback**: The picker automatically shows or hides the category switcher (page picker) based on the number of supported types.

### Example

Restrict the picker to only show SF Symbols and Emojis, defaulting to Emojis:

```swift
SymbolPicker(selection: $selection)
    .spPageTypes([.symbol, .emoji], defaultType: .emoji)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `types` | `[SPPageType]` | An array of supported page types. |
| `defaultType` | ``SymbolPicker/SPPageType`` | The page type to display initially. |
