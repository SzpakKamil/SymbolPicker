#  ``SwiftUICore/EnvironmentValues/spSymbolVariant``

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

The visual variant for SF Symbols.

## Overview

The `spSymbolVariant` property uses the ``SPSymbol/Variant`` enum to set styles like ``SPSymbol/Variant/filled`` or ``SPSymbol/Variant/outlined``. Use this value in **``SymbolPicker/SPInsetedView``** components to match the style of icons in the picker.

> Warning: Use the ``SymbolPicker/SymbolPicker/spSymbolsVariant(_:)`` modifier for configuration instead of manual environment overrides.

### Details

This property acts as a global switch for symbol styles. It keeps icons consistent across the picker, matching your app's design language.
