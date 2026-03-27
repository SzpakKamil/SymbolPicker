# ``SymbolPicker/SPPageType/emoji``

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

A browsing page for emojis.

## Overview

The `emoji` case sets the picker to show standard system emoji characters.

### Browsing

On this page, users see a grid of emojis sorted by category, such as Smileys or Food. The interface also supports skin tone selection for applicable emojis. SymbolPicker loads this content from JSON resources to ensure fast scrolling and search.
