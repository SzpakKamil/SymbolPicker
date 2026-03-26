# ``SymbolPicker/SymbolPickerModifier/spColorPickerColors(_:)-(CKColor...)``

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

Sets the available colors in the integrated color picker using a variadic list of `CKColor` objects.

## Overview

Use this modifier to provide a predefined set of colors for the user to choose from when the picker is presented.

### Example

Provide a custom color palette:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName, color: $iconColor)
    .spColorPickerColors(.red, .blue, .green)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `colors` | `CKColor...` | A variadic list of colors to display in the palette. |
