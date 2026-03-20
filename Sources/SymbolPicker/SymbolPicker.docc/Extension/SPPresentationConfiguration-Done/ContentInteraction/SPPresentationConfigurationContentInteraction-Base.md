# ``SymbolPicker/SPPresentationConfiguration/ContentInteraction``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.4")
    @Available(iPadOS, introduced: "16.4")
    @Available(macOS, introduced: "13.3")
    @Available(tvOS, introduced: "16.4")
    @Available(watchOS, introduced: "9.4")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.7")
    @Available(Xcode, introduced: "14.3")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Determines how the presentation content behaves during user interaction, such as dragging.

## Overview

When a user drags a sheet, the system must decide whether that gesture is intended to:
1.  **Scroll** the content inside the sheet (e.g., browsing a long list of symbols).
2.  **Resize** the sheet itself (e.g., expanding from `.medium` to `.large`).

The `ContentInteraction` enum gives you explicit control over this behavior, ensuring that complex layouts with internal scroll views behave predictably during user interaction.

## Topics

### Interaction Modes

- ``SymbolPicker/SPPresentationConfiguration/ContentInteraction/automatic``
- ``SymbolPicker/SPPresentationConfiguration/ContentInteraction/resizes``
- ``SymbolPicker/SPPresentationConfiguration/ContentInteraction/scrolls``
