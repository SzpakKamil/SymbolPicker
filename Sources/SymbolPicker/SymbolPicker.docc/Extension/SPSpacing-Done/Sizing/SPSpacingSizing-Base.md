# ``SymbolPicker/SPSpacing/Sizing``

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

A structure that holds the specific layout dimensions for a component.

## Overview

`Sizing` is a data container used within the ``SymbolPicker/SPSpacing`` configuration closure to return multiple dimensions simultaneously. It supports optional values for each attribute, allowing you to only override specific dimensions while letting the rest use their defaults.

## Topics

### Initialization

- ``SymbolPicker/SPSpacing/Sizing/init(width:height:horizontalPadding:verticalPadding:)``

### Layout Properties

- ``SymbolPicker/SPSpacing/Sizing/width``
- ``SymbolPicker/SPSpacing/Sizing/height``
- ``SymbolPicker/SPSpacing/Sizing/horizontalPadding``
- ``SymbolPicker/SPSpacing/Sizing/verticalPadding``
