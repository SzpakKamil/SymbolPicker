# ``SymbolPicker/SymbolPickerModifier/spPresentationBackgroundInteraction(_:)``

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

Set background interaction behavior for the presented picker surface.

## Overview

Determine if users can interact with views behind the picker. This modifier helps you control the flow of your application during asset selection.

### Example

Allow interaction with the background view while the picker is open:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPresentationBackgroundInteraction(.enabled)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction`` | The background interaction behavior. |
