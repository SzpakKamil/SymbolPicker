# ``SymbolPicker/SymbolPickerModifier/spColorPickerSupportsOpacity(_:)``

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

Toggle opacity adjustment support in the integrated color picker.

## Overview

Enable this option to provide an opacity slider in the color selection interface. This allows users to adjust the transparency of their selected color.

### Example

Enable opacity support for the color picker:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName, color: $iconColor)
    .spColorPickerSupportsOpacity(true)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Bool` | Toggle for opacity support. |
