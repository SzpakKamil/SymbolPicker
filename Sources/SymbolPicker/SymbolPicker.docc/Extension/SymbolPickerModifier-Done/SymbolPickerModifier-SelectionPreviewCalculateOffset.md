# ``SymbolPicker/SymbolPickerModifier/spSelectionPreviewCalculateOffset(_:)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "26.0")
    @Available(iPadOS, introduced: "26.0")
    @Available(macOS, introduced: "26.0")
    @Available(tvOS, introduced: "26.0")
    @Available(watchOS, introduced: "26.0")
    @Available(visionOS, introduced: "26.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Sets a custom closure to calculate the vertical offset of the selection preview card based on the grid's scroll position.

## Overview

Use this modifier to create advanced scrolling effects where the preview card moves dynamically as the user scrolls through the asset grid.

### Example

Move the preview card upwards as the user scrolls down:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spSelectionPreviewCalculateOffset { geometry in
        geometry.contentOffset.y * 0.1
    }
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `closure` | `@Sendable (ScrollGeometry) -> CGFloat` | A closure that returns the desired vertical offset for the preview card. |
