#  ``SwiftUICore/EnvironmentValues/spSymbolVariant``

The visual variant for SF Symbols in the picker.

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

> Warning: Use this to ensure **Inset Views** match the style of icons in the picker. Prefer using the provided `spSymbolsVariant(_:)` modifier for overall configuration instead of manual environment overrides.

### End User Impact

Provides a global toggle for the visual style of all symbols in the picker. This ensures consistency with your app's overall iconography (e.g., always using filled icons in a specific context).
