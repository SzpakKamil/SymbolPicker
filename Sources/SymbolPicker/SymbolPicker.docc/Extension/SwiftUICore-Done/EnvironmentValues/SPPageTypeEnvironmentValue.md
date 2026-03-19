#  ``SwiftUICore/EnvironmentValues/spPageType``

A ``SPPageType`` value that determines the currently active category of data being displayed.

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

A ``SPPageType`` represents the type of content (image, emoji, or symbol) that can be displayed in the ``SymbolPicker``.

Use this property to observe or switch categories within custom **``SymbolPicker/SPInsetedView``**.

> Warning: Never overwrite this value manually on the standard ``SymbolPicker/SymbolPicker`` as it disrupts the synchronization between the search bar, category picker, and item list.

### End User Impact

It allows you to programmatically switch between the symbol, emoji, and color pickers. You can also observe this binding to react when the user manually switches pages.
