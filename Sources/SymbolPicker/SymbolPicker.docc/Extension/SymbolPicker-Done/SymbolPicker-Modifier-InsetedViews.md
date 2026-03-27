# ``SymbolPicker/SymbolPicker/spInsetedViews(replaceDefaults:views:)``

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

Inject custom views into the picker layout.

## Overview

Use this modifier to add or replace headers, footers, and other custom elements. You provide a closure that returns an array of `SPInsetedView` objects. These views appear within the picker's scrollable area, allowing you to brand the interface or add instructions.

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `replaceDefaults` | `Bool` | Set to `true` to remove standard inseted views; `false` to keep them alongside your custom ones. |
| `views` | `() -> [SPInsetedView]` | A closure returning the custom views you want to insert. |
