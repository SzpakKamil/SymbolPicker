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

A configuration object that defines the layout and padding for picker components.

## Overview

`SPSpacing` provides granular control over the size and padding of UI elements in `SymbolPicker`. It adapts to every platform and responds to system `DynamicTypeSize` changes.

### Adaptive Layout

Use the reactive initializer for the best results. It provides the current `DynamicTypeSize` so you can return a ``SymbolPicker/SPSpacing/Sizing`` object that scales with accessibility settings. This ensures your custom layout remains usable for all users.

### Component Targeting

Each spacing object targets one ``SymbolPicker/SPSpacing/Component``, such as the color picker or the asset grid. This targeting ensures your layout changes only affect the intended part of the interface.

## Topics

### Initialization

- ``SymbolPicker/SPSpacing/init(component:configuration:)``
- ``SymbolPicker/SPSpacing/init(component:width:height:horizontalPadding:verticalPadding:)``

### Core Properties

- ``SymbolPicker/SPSpacing/component``

### Nested Types

- ``SymbolPicker/SPSpacing/Sizing``
- ``SymbolPicker/SPSpacing/Attribute``
- ``SymbolPicker/SPSpacing/Component``
- ``SymbolPicker/SPSpacingBuilder``
