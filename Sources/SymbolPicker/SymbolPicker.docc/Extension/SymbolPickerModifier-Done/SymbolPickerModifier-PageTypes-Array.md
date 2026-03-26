# ``SymbolPicker/SymbolPickerModifier/spPageTypes(_:defaultType:)-([SPPageType],_)``

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

Configures the supported asset categories and the default selected category using an array.

## Overview

Use this modifier to restrict the presented picker to specific types of assets by providing an array of supported categories.

### Example

Restrict the picker to only Emojis:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, emoji: $emoji)
    .spPageTypes([.emoji], defaultType: .emoji)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `types` | `[SPPageType]` | An array of supported page types. |
| `defaultType` | ``SymbolPicker/SPPageType`` | The page type to display initially. |
