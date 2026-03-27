# ``SymbolPicker/SPInsetedView``

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

A container for custom UI elements in SymbolPicker.

## Overview

`SPInsetedView` lets you place any SwiftUI view into predefined slots in the picker, such as the top, bottom, or toolbar.

Use the `spInsetedViews` modifier on a `SymbolPicker` to provide an array of these containers. They allow you to add headers, footers, or extra controls to the interface.

### Key Features

- **Placement Awareness**: Each view uses an ``SymbolPicker/SPInsetedView/Placement`` to set its location.
- **Adaptive Layout**: SymbolPicker adjusts its internal spacing and scroll insets to fit these views.
- **Generic Content**: The container can wrap any SwiftUI view.

## Topics

### Initializers
- ``SymbolPicker/SPInsetedView/init(placement:spacing:view:)``

### Enumerations
- ``SymbolPicker/SPInsetedView/Placement``
