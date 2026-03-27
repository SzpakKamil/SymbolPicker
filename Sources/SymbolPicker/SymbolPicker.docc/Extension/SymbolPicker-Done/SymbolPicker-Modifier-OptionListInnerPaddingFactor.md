# ``SymbolPicker/SymbolPicker/spOptionListInnerPaddingFactor(_:)``

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

Adjust the internal spacing of option list items.

## Overview

Apply a padding factor to control how much space surrounds the text and icons within each list row. Higher values increase the gap between the item's content and its border. This modifier helps you match the picker's density to the rest of your app's design.

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `CGFloat` | The multiplier used to calculate internal item padding. |
