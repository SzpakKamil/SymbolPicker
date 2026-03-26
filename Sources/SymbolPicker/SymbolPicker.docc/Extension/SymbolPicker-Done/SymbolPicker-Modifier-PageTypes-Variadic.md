# ``SymbolPicker/SymbolPicker/spPageTypes(_:defaultType:)-(SPPageType...,_)``

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

Configures the supported page types and the default selected page using a variadic list.

## Overview

Use this modifier to define which categories of symbols (e.g., system icons, custom icons) are available in the picker and which one is shown by default.

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `types` | `SPPageType...` | A variadic list of supported page types. |
| `defaultType` | `SPPageType` | The page type to display initially. |
