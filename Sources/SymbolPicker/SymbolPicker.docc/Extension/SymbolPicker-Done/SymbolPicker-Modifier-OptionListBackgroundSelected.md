# ``SymbolPicker/SymbolPicker/spOptionListBackgroundSelected(_:)``

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

Set the background color for selected items in the option list.

## Overview

Apply this modifier to highlight the active selection with a specific color. This creates a clear visual contrast between the chosen item and the rest of the list. You pass a `Color` to define the background for any item currently in its selected state.

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Color` | The color applied to the selected item's background. |
