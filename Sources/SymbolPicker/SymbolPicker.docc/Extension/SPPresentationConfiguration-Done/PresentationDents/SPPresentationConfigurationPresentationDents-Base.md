# ``SymbolPicker/SPPresentationConfiguration/PresentationDents``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.0")
    @Available(iPadOS, introduced: "16.0")
    @Available(macOS, introduced: "13.0")
    @Available(tvOS, introduced: "16.0")
    @Available(watchOS, introduced: "9.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.7")
    @Available(Xcode, introduced: "14.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Defines the size of a sheet presentation.

## Overview

The `PresentationDents` enum allows you to define the initial and allowed sizes for a sheet presentation. By providing a set of these detents, you enable the user to resize the sheet by dragging the grabber. This type directly maps to SwiftUI's `PresentationDetent`, offering a consistent API across different iOS versions.

You can combine multiple detents (e.g., `[.medium, .large]`) to give users flexibility in how much screen space the picker consumes.

## Topics

### Detent Sizes

- ``SymbolPicker/SPPresentationConfiguration/PresentationDents/large``
- ``SymbolPicker/SPPresentationConfiguration/PresentationDents/medium``
- ``SymbolPicker/SPPresentationConfiguration/PresentationDents/height(_:)``
- ``SymbolPicker/SPPresentationConfiguration/PresentationDents/fraction(_:)``
