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

Calculate the vertical offset of the selection preview card based on the scroll position.

## Overview

Apply advanced scrolling effects to the preview card. This modifier allows you to move the card dynamically as users navigate the asset grid.

### Example

Offset the preview card upwards during scrolling:

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
| `closure` | `@Sendable (ScrollGeometry) -> CGFloat` | A closure that returns the vertical offset for the preview card. |
