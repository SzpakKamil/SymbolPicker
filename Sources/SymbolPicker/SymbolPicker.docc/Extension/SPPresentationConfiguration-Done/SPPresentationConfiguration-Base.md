# ``SymbolPicker/SPPresentationConfiguration``

You configure how the SymbolPicker looks and behaves during presentation.

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

The `SPPresentationConfiguration` struct centralizes all your choices for the picker's modal UI. Instead of scattering modifiers across your views, you pack your settings into this object.

This struct directly influences the underlying SwiftUI sheet and popover logic. It controls everything from corner radius and background colors to how users interact with the app behind the picker.

- **Modal Style**: You use ``presentationType`` to choose between sheets, popovers, or full-screen covers.
- **Sheet Behavior**: You set heights with ``presentationDents`` and toggle the grab handle with ``presentationDragIndicator``.
- **Background Interaction**: You decide if the user can still touch the main app using ``presentationBackgroundInteraction``.

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
