#  ``SwiftUICore/EnvironmentValues/spSelection``

A binding to an ``SPSelection`` value, which is the core selection for the asset in the picker. ``SPSelection`` is a generic struct representing the selected asset (symbol, emoji, image, or color) within the ``SymbolPicker/SymbolPicker``.

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

This property is highly recommended for custom **``SymbolPicker/SPInsetedView``** that need to display or update selection.

> Warning: Never overwrite this property manually on the standard ``SymbolPicker/SymbolPicker`` as it breaks the core logic connecting assets to your selection binding.

### End User Impact

The primary way to get the user's selection from the picker. You can use it to set an initial selection or perform actions immediately when the selection changes.
