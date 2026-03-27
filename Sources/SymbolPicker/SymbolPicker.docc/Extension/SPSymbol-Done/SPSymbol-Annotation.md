# ``SymbolPicker/SPSymbol/annotation``

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

A descriptive name for search and accessibility.

## Overview

The `annotation` property provides a localized string that describes the symbol's concept. This metadata powers the search engine and provides a high-quality experience for users of assistive technology.

### Search

When you type in the search bar, the system queries this field across the symbol library. Because the strings are localized, you can search for icons in your native language.

### Accessibility

The annotation serves as the default accessibility label. VoiceOver reads this string to the user, ensuring the picker remains navigable for everyone.

### Source

The system loads these strings from JSON resources in the package bundle to match the user's system language.
