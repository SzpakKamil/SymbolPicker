# ``SymbolPicker/SPDataAsset-Done/SPDataAsset-Base``

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

The foundation for all SymbolPicker assets.

## Overview

The `SPDataAsset` protocol defines the core requirements for any asset shown in SymbolPicker. It standardizes how the system fetches, searches, and renders symbols, emojis, and images.

### Key Requirements

- **Metadata**: Every asset has an annotation, category, and tags for search.
- **Loading**: Assets load from bundle JSON files using a specific file prefix.
- **Platform Support**: The system checks if an asset works on the current OS before showing it.
- **SwiftUI**: Each asset must provide a view for the picker grid.

### Conformance

To follow `SPDataAsset`, a type must be `Sendable`, `Hashable`, `Equatable`, `Identifiable`, and `Codable`. This ensures the data is safe, unique, and easy to save.

Existing models:
- ``SymbolPicker/SPSymbol``: Apple's SF Symbols.
- ``SymbolPicker/SPEmoji``: Unicode emojis with skin tone support.
- ``SymbolPicker/SPImage``: Custom images.
