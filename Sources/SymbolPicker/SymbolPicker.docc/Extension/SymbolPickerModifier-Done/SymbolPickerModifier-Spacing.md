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

Adjust gaps between the main layout blocks in the picker.

## Overview

Customize vertical or horizontal spacing between elements like the search bar, category switcher, and asset grid.

### Example

Increase vertical spacing between elements:

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
| `content` | `() -> [SPSpacing]` | A closure that defines custom spacing. |
