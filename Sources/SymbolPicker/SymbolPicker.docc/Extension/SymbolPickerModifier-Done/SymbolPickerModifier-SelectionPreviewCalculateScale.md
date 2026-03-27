# ``SymbolPicker/SymbolPickerModifier/spSelectionPreviewCalculateScale(_:)``

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

Calculate the scale of the selection preview card based on the scroll position.

## Overview

Use this modifier to create dynamic scaling effects. You can shrink the preview card as users scroll deeper into the asset grid to maintain visual balance.

### Example

Scale the preview card based on scroll depth:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spSelectionPreviewCalculateScale { geometry in
        max(0.8, 1.0 - (geometry.contentOffset.y / 1000))
    }
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `closure` | `@Sendable (ScrollGeometry) -> CGFloat` | A closure that returns the scale factor for the preview card. |
