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

You define how the picker responds to drag gestures.

## Overview

When you drag a sheet, the system chooses between two actions. You either scroll the content inside the sheet or you resize the sheet itself.

The `ContentInteraction` enum gives you explicit control. You use it to prevent gestures from conflicting. For example, you can lock the sheet height so a user only scrolls through the symbol grid. This keeps the experience predictable when your layout includes complex scroll views.

## Topics

### Interaction Modes

- ``SymbolPicker/SPPresentationConfiguration/ContentInteraction/automatic``
- ``SymbolPicker/SPPresentationConfiguration/ContentInteraction/resizes``
- ``SymbolPicker/SPPresentationConfiguration/ContentInteraction/scrolls``
