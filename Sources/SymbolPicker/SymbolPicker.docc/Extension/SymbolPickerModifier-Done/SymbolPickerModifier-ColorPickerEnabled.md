# ``SymbolPicker/SymbolPickerModifier/spColorPickerEnabled(_:)``

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

Sets whether the integrated color picker is visible in the presented picker.

## Overview

Use this modifier to show or hide the color selection palette. When disabled, the picker presents only the asset grid without any color selection controls.

### Example

Hide the color picker:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName, color: $iconColor)
    .spColorPickerEnabled(false)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Bool` | A Boolean value that indicates whether the color picker is shown. |
