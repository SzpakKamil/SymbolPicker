# ``SymbolPicker/SPPresentationConfiguration/DisplayType``

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

Defines the visual style of the presentation.

## Overview

The `DisplayType` enum acts as a high-level configuration for the `SymbolPicker`'s presentation. Instead of manually applying `.sheet`, `.popover`, or `.fullScreenCover` modifiers in your SwiftUI code, you can simply set this property, and the internal bridging layer will apply the correct presentation logic.

This abstraction ensures that the picker looks and behaves correctly across different platforms (iOS, macOS, iPadOS) and screen sizes.

## Topics

### Display Styles

- ``SymbolPicker/SPPresentationConfiguration/DisplayType/default``
- ``SymbolPicker/SPPresentationConfiguration/DisplayType/popover``
- ``SymbolPicker/SPPresentationConfiguration/DisplayType/sheet``
- ``SymbolPicker/SPPresentationConfiguration/DisplayType/fullScreenCover``
