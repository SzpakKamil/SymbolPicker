# ``SymbolPicker/SymbolPicker/spOptionListForegroundFocused(_:)``

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

Define the foreground color for focused items in the option list.

## Overview

Apply this modifier to change how text and icons appear when you highlight an item. This helps users track their selection during keyboard navigation or when using a crown on watchOS. You pass a `Color` to set a clear visual state for the active element.

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Color` | The color applied to the focused item's foreground. |
