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

A container for secondary views that are displayed in specific areas of the symbol picker, such as the top or bottom bar.

## Overview

`SPInsetedView` allows you to inject custom SwiftUI views into the picker's layout at predefined locations. It provides a chainable API for configuring background styles, conditional visibility, and custom padding.

This component is primarily used when configuring the ``SymbolPicker/SymbolPickerConfiguration/presentation`` to add supplemental information, branding, or additional controls to the picker's interface.

### View Placement

Each `SPInsetedView` must be initialized with a placement, which determines where the view will be rendered within the picker's container.

### Dynamic Visibility

Using the ``spIsDisplayed(when:)`` method, you can control when an inset view is visible based on the current environment state (e.g., search text, color selection, or page type).

## Topics

### Initialization

- ``SymbolPicker/SPInsetedView/init(placement:spacing:view:)``

### Configuration Methods

- ``SymbolPicker/SPInsetedView/spBackground(_:)``
- ``SymbolPicker/SPInsetedView/spIsDisplayed(when:)``
- ``SymbolPicker/SPInsetedView/spPadding(_:value:)``

### Nested Types
Helper types used for inset view configuration.

- ``SymbolPicker/SPInsetedView/Placement``
