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

A human-readable, localized name for the page type.

## Overview

The `localizedDescription` property provides a user-facing title for each page category. This is used by the `SymbolPicker` to label tabs, section headers, or selection buttons in the user's preferred language.

### Localization Support

The property automatically handles localization by searching for the appropriate translation in the library's resource bundle. This ensures that the browsing interface remains consistent and accessible for users across different regions.

### Usage in Components

- **SPPagePicker**: Uses `localizedDescription` to label the navigation tabs, helping users understand which category they are currently browsing.
- **Accessibility**: This property is also used to provide descriptive labels for screen readers and other assistive technologies.
