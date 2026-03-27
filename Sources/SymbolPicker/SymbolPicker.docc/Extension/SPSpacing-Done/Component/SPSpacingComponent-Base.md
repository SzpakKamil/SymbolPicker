# ``SymbolPicker/SPSpacing/Component``

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

An enumeration of UI components for spacing and sizing customization.

## Overview

The `Component` enum identifies which part of the `SymbolPicker` you want to customize. Use these cases to target specific areas for layout changes.

### Customization Targets

You can modify the color picker, the main asset grid, or the selection preview. Identifying the component ensures your spacing rules apply only to the intended part of the interface. This modular approach lets you build a unique layout by adjusting each component individually.

## Topics

### Components

- ``SymbolPicker/SPSpacing/Component/colorPicker``
- ``SymbolPicker/SPSpacing/Component/optionList``
- ``SymbolPicker/SPSpacing/Component/previewSelection``
