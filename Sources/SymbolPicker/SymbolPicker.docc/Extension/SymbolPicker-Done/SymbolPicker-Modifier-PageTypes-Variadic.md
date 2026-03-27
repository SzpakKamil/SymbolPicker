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

Sets the available page types and the default page.

## Overview

Use this modifier to choose which asset categories appear in the picker. You also set which category the picker shows first.

### Parameters

- **types**: A variadic list of ``SymbolPicker/SPPageType`` values like `.symbol` or `.emoji`.
- **defaultType**: The page type to show when the picker opens.

### Details

This modifier lets you restrict the picker to specific content. For example, you can create a picker that only shows symbols and emojis while hiding the color and image options.
