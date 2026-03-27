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

The system icon name for the page type.

## Overview

The `systemName` property returns an SF Symbol name for each page category. SymbolPicker uses these icons in tabs and selection buttons.

### Icons

- **Symbol**: Returns `"star.fill"`.
- **Emoji**: Returns `"hand.thumbsup.fill"`.
- **Image**: Returns `"photo"`.
