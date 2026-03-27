# ``SymbolPicker/SPPageType/localizedDescription``

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

A localized name for the page type.

## Overview

The `localizedDescription` property provides the label for page categories in the user's language. SymbolPicker uses these names for tabs and section headers.

### Localization

The property finds the correct translation in the library bundle. This keeps the interface consistent for users in different regions.

### Components

- **SPPagePicker**: Uses these descriptions to label navigation tabs.
- **Accessibility**: Provides descriptive names for VoiceOver and other assistive tools.
