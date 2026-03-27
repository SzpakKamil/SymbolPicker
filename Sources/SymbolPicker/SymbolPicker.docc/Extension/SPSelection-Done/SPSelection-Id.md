# ``SymbolPicker/SPSelection/id``

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

A unique identifier for the selection, ensuring it conforms to the `Identifiable` protocol.

## Overview

The `id` property uniquely identifies a selection for the `Identifiable` protocol. The library computes this ID dynamically based on the selection ``SymbolPicker/SPSelection/type`` and its data.

### ID Patterns

The format of the ID string depends on the asset type:
- **Symbol**: `"symbol:<hash_of_symbol_id>"`
- **Emoji**: `"emoji:<emoji_id>:tone<skin_tone>"`
- **Image**: `"image:<uuid>"`
- **Color**: `"color:<hash_of_color_id>"`

### SwiftUI Integration

SwiftUI uses these IDs to track updates in grids and lists. Because the ID changes when the underlying asset type or value changes, the system can perform smooth visual transitions and animations between different icons or colors in your interface.
