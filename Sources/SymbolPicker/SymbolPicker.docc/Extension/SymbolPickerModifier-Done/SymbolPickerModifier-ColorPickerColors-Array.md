# ``SymbolPicker/SymbolPickerModifier/spColorPickerColors(_:)-([CKColor])``

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

Define available colors for the integrated color picker with an array.

## Overview

Provide a predefined color set by passing an array of color options. This modifier determines the colors users can choose from when the picker is active.

### Example

Apply brand colors to the picker:

```swift
let brandColors: [CKColor] = [.red, .blue, .green]

Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName, color: $iconColor)
    .spColorPickerColors(brandColors)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `colors` | `[CKColor]` | An array of colors for the palette. |
