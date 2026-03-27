# ``SymbolPicker/SPDataAsset/annotation``

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

The localized name for data assets like SF Symbols and Emojis.

## Overview

The `annotation` property stores the asset name for accessibility and search. A star symbol uses "Star" or "Favorite" as its annotation.

### Search

Users locate items by name through the ``SymbolPicker/SPDataAsset/matches(_:)`` method. This property serves as the primary search key in the symbol picker.

### Accessibility

UI components read the `annotation` property for accessibility labels. This identifies symbols for screen readers like VoiceOver.

### Localization

`SPDataAsset` conforms to `Codable` and loads annotations from localized JSON files like `symbols_en.json`. The metadata matches the system language automatically.
