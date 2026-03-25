# ``SymbolPicker/SPSelection/type``

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

The discriminator that defines the current category of the selection.

## Overview

The `type` property determines which asset category (symbol, emoji, image, or color) is currently active. Changing this value tells the ``SymbolPicker/SPSelection`` how to handle rendering, persistence, and data access.

### Asset Discrimination

The ``SymbolPicker/SPSelection/SelectionType`` enum ensures that only one asset type is active at any given time. When the type is changed, the picker's logic switches to using the corresponding data property.

### Codable and Persistence

This property is a key part of the selection's `Codable` implementation. It is encoded as a string to the `type` key, allowing the decoder to correctly identify which asset data it needs to reconstruct from the persisted JSON or dictionary.
