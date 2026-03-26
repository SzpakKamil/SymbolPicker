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

Sets the background interaction behavior for the presented picker's surface.

## Overview

Use this modifier to control whether the user can interact with the view behind the picker while it is presented.

### Example

Allow interacting with the background view:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPresentationBackgroundInteraction(.enabled)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction`` | The desired background interaction behavior. |
