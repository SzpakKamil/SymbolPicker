# ``SymbolPicker/SPEmoji/category``

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

The top-level group to which the emoji belongs.

## Overview

The `category` property defines the primary grouping for the emoji (e.g., `"Smileys & Emotion"`, `"Animals & Nature"`, `"Travel & Places"`). It is used by the ``SymbolPicker/SPDataManager`` to organize the emoji library into logical sections for navigation.

### Organization

Categories allow the `SymbolPicker` to provide a tabbed or paginated interface where users can quickly switch between broad groups of emojis.
