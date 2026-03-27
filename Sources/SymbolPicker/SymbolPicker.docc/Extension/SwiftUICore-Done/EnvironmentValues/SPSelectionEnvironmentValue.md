#  ``SwiftUICore/EnvironmentValues/spSelection``

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

A binding to the current asset selection.

## Overview

The `spSelection` property binds to an ``SPSelection`` struct. This object holds the selected symbol, emoji, image, or color. Use this property in custom **``SymbolPicker/SPInsetedView``** layouts to display or update the current selection.

> Warning: Manually overwriting this property on the standard ``SymbolPicker/SymbolPicker`` breaks the link between assets and your data binding.

### Details

This property provides direct access to the user's choice. Use it to set a starting asset or to perform actions as soon as the selection changes.
