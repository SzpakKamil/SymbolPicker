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

Select which asset categories the picker displays and set the initial view.

## Overview

Restrict your picker to specific content types like SF Symbols, Emojis, or custom images. This narrows the scope for your users and ensures they only select assets relevant to your data.

### Category Control

- **Choose Types**: Include any mix of `.symbol`, `.emoji`, and `.image`.
- **Set Start Page**: The `defaultType` parameter defines which category users see when they first open the picker.
- **Adaptive UI**: The picker hides its category switcher if you only support one type.

### Example

Show only SF Symbols and Emojis, starting the user on the Emoji tab:

```swift
SymbolPicker(selection: $selection)
    .spPageTypes([.symbol, .emoji], defaultType: .emoji)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `types` | `[SPPageType]` | The list of categories you want to support. |
| `defaultType` | ``SymbolPicker/SPPageType`` | The category that opens first. |
