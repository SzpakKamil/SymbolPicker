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

The `type` property defines which asset category is active. It identifies the selection as a symbol, emoji, image, or color.

### Asset Discrimination

This property tells ``SymbolPicker/SPSelection`` how to handle rendering, persistence, and data access. The ``SymbolPicker/SPSelection/SelectionType`` enum ensures only one category is active at a time. When the type changes, the picker's logic switches to the corresponding data property for all UI operations.

### Persistence

This property is a core part of the selection's `Codable` implementation. The library encodes it as a string to the `type` key. This allows the decoder to identify which asset data it needs to reconstruct from JSON or dictionaries, ensuring your user's choice survives application restarts.
