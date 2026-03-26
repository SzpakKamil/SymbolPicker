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

Customizes the inseted views within the picker.

## Overview

Use this modifier to add or replace custom views (like headers or footers) within the picker's layout.

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `replaceDefaults` | `Bool` | Whether to replace the default inseted views. |
| `views` | `() -> [SPInsetedView]` | A closure that returns an array of custom views. |
