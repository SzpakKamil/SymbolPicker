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

The top-level group for the emoji.

## Overview

The `category` property sets the broad section for an emoji, such as `"Smileys & Emotion"`, `"Animals & Nature"`, or `"Travel & Places"`.

### Organization

``SymbolPicker/SPDataManager`` uses these categories to sort the library. This allows the picker to show a paginated layout where you can switch between sections. Each category appears as a distinct group in the navigation menu, making it easy to find assets without scrolling through the whole library.
