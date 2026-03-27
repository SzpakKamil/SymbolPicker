# ``SymbolPicker/SymbolPickerModifier/spPresentationCornerRadius(_:)``

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

Set the corner radius for the presented picker surface.

## Overview

Customize the roundness of sheet or popover corners. This modifier allows you to match the picker container to your app's design language.

### Example

Apply a 30-point corner radius to the picker:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPresentationCornerRadius(30)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `CGFloat` | The corner radius for the presentation surface. |
