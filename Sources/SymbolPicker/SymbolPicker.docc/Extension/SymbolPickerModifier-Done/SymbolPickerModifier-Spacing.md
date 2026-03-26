# ``SymbolPicker/SymbolPickerModifier/spSpacing(_:)``

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

Adjusts the vertical or horizontal gaps between the presented picker's main layout blocks.

## Overview

Use this modifier to customize the spacing between elements like the search bar, category switcher, and the asset grid.

### Example

Increase the vertical spacing between the search bar and the grid:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spSpacing {
        SPSpacing(value: 20, type: .vertical)
    }
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `content` | `() -> [SPSpacing]` | A closure that returns the custom spacing definitions. |
