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

The `id` property is computed dynamically based on the current selection ``SymbolPicker/SPSelection/type`` and its corresponding data. It is used by SwiftUI to uniquely identify selections in grids, lists, and for animation transitions.

### ID Patterns

The format of the ID string depends on the asset type:

- **Symbol**: `"symbol:<hash_of_symbol_id>"`
- **Emoji**: `"emoji:<emoji_id>:tone<skin_tone>"`
- **Image**: `"image:<uuid>"`
- **Color**: `"color:<hash_of_color_id>"`

### SwiftUI Integration

Because the ID changes when the underlying asset type or value changes, SwiftUI can correctly track selection updates and perform smooth visual transitions between different icons or colors in the picker interface.
