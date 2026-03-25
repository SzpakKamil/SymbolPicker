# ``SymbolPicker/SPPageType/systemName``

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

Returns a system icon name for the page type.

## Overview

The `systemName` property provides an SF Symbol name representing each page category. This is used by the `SymbolPicker` to display appropriate icons in tabs or selection buttons.

### Default Icons

- **Symbol**: Returns `"star.fill"`.
- **Emoji**: Returns `"hand.thumbsup.fill"`.
- **Image**: Returns `"photo"`.
