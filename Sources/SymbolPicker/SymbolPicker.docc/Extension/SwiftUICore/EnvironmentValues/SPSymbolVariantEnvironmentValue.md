#  ``SwiftUICore/EnvironmentValues/spSymbolVariant``

An ``SPSymbol/Variant`` value that determines the visual variant for SF Symbols in the picker. ``SPSymbol/Variant`` is an enum defining the visual style of an SF Symbol, such as ``SPSymbol/Variant/filled`` or ``SPSymbol/Variant/outlined``.

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

Use this to ensure **``SymbolPicker/SPInsetedView``** match the style of icons in the picker.

> Warning: Prefer using the provided ``SymbolPicker/SymbolPicker/spSymbolsVariant(_:)`` modifier for overall configuration instead of manual environment overrides.

### End User Impact

Provides a global toggle for the visual style of all symbols in the picker. This ensures consistency with your app's overall iconography (e.g., always using filled icons in a specific context).
