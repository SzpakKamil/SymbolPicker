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

You control the height and resizability of the picker sheet.

## Overview

The `PresentationDents` enum sets the allowed sizes for your sheet. By providing a list of these detents, you let users resize the picker by dragging the grabber. 

This type directly maps to SwiftUI's native presentation detents. You can mix and match styles—like combining `.medium` and `.large`—to give users flexibility in how much screen space they want to use for browsing icons.

## Topics

### Detent Sizes

- ``SymbolPicker/SPPresentationConfiguration/PresentationDents/large``
- ``SymbolPicker/SPPresentationConfiguration/PresentationDents/medium``
- ``SymbolPicker/SPPresentationConfiguration/PresentationDents/height(_:)``
- ``SymbolPicker/SPPresentationConfiguration/PresentationDents/fraction(_:)``
