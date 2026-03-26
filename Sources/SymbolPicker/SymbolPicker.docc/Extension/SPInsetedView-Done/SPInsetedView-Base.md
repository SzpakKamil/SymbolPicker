# ``SymbolPicker/SPInsetedView``

A container view for injecting custom UI elements into predefined slots within the `SymbolPicker`.

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

## Overview

`SPInsetedView` is a core part of the `SymbolPicker` extensibility model. It allows developers to place any SwiftUI view into specific "safe area" or "toolbar" locations, such as at the top of the picker, at the bottom, or in platform-specific toolbar slots.

By using the `spInsetedViews` modifier on a `SymbolPicker`, you can provide an array of these containers to add headers, footers, or additional interactive controls.

### Key Aspects

- **Placement Awareness**: Each `SPInsetedView` is associated with a ``SymbolPicker/SPInsetedView/Placement``, which determines where it appears in the hierarchy.
- **Adaptive Layout**: The picker automatically adjusts its internal spacing and scroll insets to accommodate these views.
- **Generic Content**: It can wrap any type of SwiftUI view.

## Topics

### Initializers

- ``SymbolPicker/SPInsetedView/init(placement:content:)``

### Properties

- ``SymbolPicker/SPInsetedView/placement``
- ``SymbolPicker/SPInsetedView/content``

### Enumerations

- ``SymbolPicker/SPInsetedView/Placement``
