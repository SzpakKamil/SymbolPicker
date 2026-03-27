#  ``SwiftUICore/EnvironmentValues/spPageType``

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

The active asset category in the picker.

## Overview

The `spPageType` property tracks which content type—image, emoji, or symbol—the picker currently shows. Use this value in custom **``SymbolPicker/SPInsetedView``** components to observe or change categories.

> Warning: Overwriting this value on the standard ``SymbolPicker/SymbolPicker`` breaks synchronization between the search bar and the item list.

### Usage

This property lets you switch between pickers programmatically. You can also react when users manually change pages to update your app's layout or state.
