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

You set how the picker appears to the user.

## Overview

The `DisplayType` enum simplifies cross-platform UI. You choose a single style, and the library maps it to the correct SwiftUI modifier for each device. This saves you from writing manual logic for sheets, popovers, or full-screen covers.

Using this abstraction ensures the picker feels native everywhere. It handles the subtle differences between how a sheet behaves on an iPhone versus how it looks on a Mac window.

## Topics

### Display Styles

- ``SymbolPicker/SPPresentationConfiguration/DisplayType/default``
- ``SymbolPicker/SPPresentationConfiguration/DisplayType/popover``
- ``SymbolPicker/SPPresentationConfiguration/DisplayType/sheet``
- ``SymbolPicker/SPPresentationConfiguration/DisplayType/fullScreenCover``
