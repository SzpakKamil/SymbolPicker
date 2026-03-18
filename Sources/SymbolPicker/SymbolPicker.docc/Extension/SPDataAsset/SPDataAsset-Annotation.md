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

A localized description or name for the data asset, supporting SF Symbols, Emojis, and custom icons.

## Overview

The `annotation` property provides a human-readable name for the asset, which is crucial for accessibility and searching. For example, a star symbol might have an annotation like "Star" or "Favorite".

### Role in Search

The ``SymbolPicker/SPDataAsset/matches(_:)`` method uses the `annotation` to determine if an asset should be returned in response to a user's search query. This is often the most direct way for users to find what they are looking for by name.

### Accessibility

When an asset is rendered in the UI, the `annotation` can serve as the primary source for accessibility labels (e.g., `accessibilityLabel(_:)` in SwiftUI). This ensures that the picker is fully usable for individuals relying on screen readers like VoiceOver.

### Consistency Across Locales

Because `SPDataAsset` is `Codable`, the `annotation` is typically loaded from localized JSON files (e.g., `symbols_en.json`, `symbols_pl.json`). This allows the picker's metadata to automatically adapt to the user's system language, providing a seamless and intuitive experience globally.
