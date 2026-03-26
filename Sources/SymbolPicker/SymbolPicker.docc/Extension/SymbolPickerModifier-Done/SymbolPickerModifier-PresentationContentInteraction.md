# ``SymbolPicker/SymbolPickerModifier/spPresentationContentInteraction(_:)``

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

Sets the content interaction behavior for the presented picker's surface.

## Overview

Use this modifier to control whether the picker's content should scroll internally or expand the sheet when the user interacts with it.

### Example

Force the content to scroll rather than expanding the sheet:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPresentationContentInteraction(.scrolls)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | ``SymbolPicker/SPPresentationConfiguration/ContentInteraction`` | The desired content interaction behavior. |
