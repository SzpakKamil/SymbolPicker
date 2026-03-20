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

A localized descriptive name used for searching and accessibility.

## Overview

The `annotation` property provides a human-readable, localized string that describes the visual concept of the symbol. This metadata is essential for both the search functionality within the picker and for providing a high-quality accessibility experience.

### Search Integration

When a user types into the search bar, the ``SymbolPicker/SPDataManager`` queries this field across the loaded symbol collection. Because it is localized, users can search for symbols using terms in their native language, significantly improving the discoverability of specific icons.

### Accessibility

Beyond search, the annotation serves as the default accessibility label. When VoiceOver is active, this string is read to the user, ensuring that the interface remains navigable for everyone. It is recommended to keep these strings concise yet descriptive.

### Data Source

These strings are typically loaded from localized JSON resources within the package bundle, ensuring that the UI remains consistent with the user's system language settings.
