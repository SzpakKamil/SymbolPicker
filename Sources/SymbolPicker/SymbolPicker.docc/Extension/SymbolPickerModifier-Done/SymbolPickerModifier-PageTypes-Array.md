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

Configure asset categories and the default selection using an array.

## Overview

Restrict the picker to specific asset categories by providing an array of supported types. This modifier also sets the category the picker displays on launch.

### Example

Limit the picker to Emojis only:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, emoji: $emoji)
    .spPageTypes([.emoji], defaultType: .emoji)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `types` | `[SPPageType]` | An array of supported page types. |
| `defaultType` | ``SymbolPicker/SPPageType`` | The initial page type. |
