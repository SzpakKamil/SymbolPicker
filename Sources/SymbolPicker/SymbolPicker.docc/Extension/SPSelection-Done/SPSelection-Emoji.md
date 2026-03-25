# ``SymbolPicker/SPSelection/emoji``

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

The emoji character data for the selection.

## Overview

When the selection ``SymbolPicker/SPSelection/type`` is set to ``SymbolPicker/SPSelection/SelectionType/emoji``, this property holds the current emoji character and its skin tone configuration (via ``SymbolPicker/SPEmoji``).

### Data Access

This property is private(set), ensuring that mutations go through the appropriate ``SymbolPicker/SPSelection/setEmoji(_:)`` method. This ensures that the selection type and other related states are updated correctly.

### Encoding and Decoding

Emoji data is encoded into the `emoji` key during persistence. This allows the emoji to be reconstructed accurately, including any skin tone modifiers applied by the user in the picker interface.
