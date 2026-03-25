# ``SymbolPicker/SPSelection/SelectionType``

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

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

An enumeration defining the different types of assets that can be selected in a `SymbolPicker`.

## Overview

The `SelectionType` enum serves as the primary discriminator for an ``SymbolPicker/SPSelection`` object. It determines which underlying data property (symbol, emoji, image, or color) is currently active and how the selection should be rendered by the UI.

### Supported Types

- **Symbol**: Represents an asset defined by the generic `DataAsset` type (typically ``SymbolPicker/SPSymbol``).
- **Emoji**: Represents a standard emoji character (``SymbolPicker/SPEmoji``).
- **Image**: Represents a custom image asset (``SymbolPicker/SPImage``).
- **Color**: Represents a solid color selection (`ColorKit/CKColor`).

### Data Integrity

As `SPSelection` is a polymorphic structure, the `SelectionType` ensures that the logic for rendering, hashing, and equality is correctly scoped to the active asset type. It also guides the custom `Codable` implementation to ensure data is persisted and restored correctly.

## Topics

### Asset Types

- ``SymbolPicker/SPSelection/SelectionType/symbol``
- ``SymbolPicker/SPSelection/SelectionType/emoji``
- ``SymbolPicker/SPSelection/SelectionType/image``
- ``SymbolPicker/SPSelection/SelectionType/color``
