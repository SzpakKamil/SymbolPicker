# ``SymbolPicker/SPPresentationConfiguration``

A struct that defines the visual and behavioral settings for how the SymbolPicker is presented to the user.

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

The `SPPresentationConfiguration` struct allows developers to customize the presentation behavior of the SymbolPicker. This includes controlling the corner radius, background interaction, drag indicators, and presentation dents.

### View Integration

This configuration is primarily consumed by the main ``SymbolPicker/SymbolPicker`` view and its internal bridge layers. It directly influences how the SwiftUI `.sheet` or `.popover` modifiers are configured.

- **Modal Style**: The ``presentationType`` property determines if the picker appears as a standard sheet, a fullscreen cover, or a popover (especially relevant for iPad and Mac).
- **Sheet Behavior**: Properties like ``presentationDents`` and ``presentationDragIndicator`` control the resizable nature of the sheet on iOS, allowing for "compact" (half-screen) or "detail" (full-screen) modes.
- **Background Interaction**: You can control whether the user can still interact with the views behind the picker using ``presentationBackgroundInteraction``.

### Usage Example

```swift
let configuration = SPPresentationConfiguration()
    .spPresentationCornerRadius(30)
    .spPresentationBackgroundColor(.secondarySystemBackground)
    .spPresentationDents([.medium, .large])
    .spPresentationDragIndicator(.hidden)
```

## Topics

### Display Properties
Settings that control the appearance and type of presentation.

- ``SymbolPicker/SPPresentationConfiguration/presentationType``
- ``SymbolPicker/SPPresentationConfiguration/presentationCornerRadius``
- ``SymbolPicker/SPPresentationConfiguration/presentationBackgroundColor``

### Interaction Settings
Settings that define how the user interacts with the picker and its background.

- ``SymbolPicker/SPPresentationConfiguration/presentationDragIndicator``
- ``SymbolPicker/SPPresentationConfiguration/presentationContentInteraction``
- ``SymbolPicker/SPPresentationConfiguration/presentationBackgroundInteraction``
- ``SymbolPicker/SPPresentationConfiguration/presentationDents``

### Modification Methods
Chainable methods for updating configuration properties.

- ``SymbolPicker/SPPresentationConfiguration/spPresentationCornerRadius(_:)``
- ``SymbolPicker/SPPresentationConfiguration/spPresentationType(_:)``
- ``SymbolPicker/SPPresentationConfiguration/spPresentationDragIndicator(_:)``
- ``SymbolPicker/SPPresentationConfiguration/spPresentationBackgroundColor(_:)``
- ``SymbolPicker/SPPresentationConfiguration/spPresentationContentInteraction(_:)``
- ``SymbolPicker/SPPresentationConfiguration/spPresentationBackgroundInteraction(_:)``
- ``SymbolPicker/SPPresentationConfiguration/spPresentationDents(_:)``

### Nested Types
Helper types used for configuration.

- ``SymbolPicker/SPPresentationConfiguration/DisplayType``
- ``SymbolPicker/SPPresentationConfiguration/ContentInteraction``
- ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction``
- ``SymbolPicker/SPPresentationConfiguration/PresentationDents``
