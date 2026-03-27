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

Define available colors for the integrated color picker with a variadic list.

## Overview

Provide a set of predefined colors for users. This modifier sets the palette available when the picker appears.

### Example

Set a palette with red, blue, and green:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName, color: $iconColor)
    .spColorPickerColors(.red, .blue, .green)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `colors` | `CKColor...` | A list of colors for the palette. |
