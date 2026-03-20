# ``SymbolPicker/SPSpacing/Attribute``

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

An enumeration of layout dimensions that can be configured for a component.

## Overview

The `Attribute` enum specifies which aspect of a component's layout is being queried or configured. This is primarily used internally by the `SymbolPicker`'s layout engine to resolve final dimensions based on the current environment.

## Topics

### Dimensions

- ``SymbolPicker/SPSpacing/Attribute/width``
- ``SymbolPicker/SPSpacing/Attribute/height``
- ``SymbolPicker/SPSpacing/Attribute/horizontalPadding``
- ``SymbolPicker/SPSpacing/Attribute/verticalPadding``
