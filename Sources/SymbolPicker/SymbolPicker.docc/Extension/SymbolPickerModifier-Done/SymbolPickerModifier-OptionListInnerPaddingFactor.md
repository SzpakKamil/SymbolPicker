# ``SymbolPicker/SymbolPickerModifier/spOptionListInnerPaddingFactor(_:)``

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

Sets the multiplier for the inner padding of asset cells within the presented picker's grid.

## Overview

Use this modifier to adjust how much space is left between the asset icon and the edges of its grid cell.

### Example

Increase the padding inside each asset cell:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spOptionListInnerPaddingFactor(1.5)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `CGFloat` | The multiplier for the cell's inner padding. |
