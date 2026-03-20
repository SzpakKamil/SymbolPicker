# ``SymbolPicker/SPSpacing``

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

A configuration object that defines the layout and padding dimensions for specific picker components.

## Overview

`SPSpacing` allows for granular control over the sizing and padding of various UI elements within the `SymbolPicker`. It is designed to be highly adaptive, supporting different configurations for each platform and responding to changes in system `DynamicTypeSize`.

### Adaptive Layout

The most powerful way to use `SPSpacing` is via the reactive initializer, which provides the current `DynamicTypeSize`. This allows you to return a ``SymbolPicker/SPSpacing/Sizing`` object that scales proportionally with the user's accessibility settings.

### Component Targeting

Each spacing object targets a specific ``SymbolPicker/SPSpacing/Component``, such as the color picker or the option list, ensuring that layout changes are scoped correctly.

## Topics

### Initialization

- ``SymbolPicker/SPSpacingBuilder``
- ``SymbolPicker/SPSpacing/init(component:configuration:)``
- ``SymbolPicker/SPSpacing/init(component:width:height:horizontalPadding:verticalPadding:)``

### Core Properties

- ``SymbolPicker/SPSpacing/component``

### Nested Types

- ``SymbolPicker/SPSpacing/Sizing``
- ``SymbolPicker/SPSpacing/Attribute``
- ``SymbolPicker/SPSpacing/Component``
