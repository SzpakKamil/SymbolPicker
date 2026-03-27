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

The `emoji` property holds the character data and skin tone configuration for a selection. This property is active when the selection ``SymbolPicker/SPSelection/type`` is set to ``SymbolPicker/SPSelection/SelectionType/emoji``.

### Data Access

Because this property is `private(set)`, you must use ``SymbolPicker/SPSelection/setEmoji(_:)`` to update it. This ensures the selection type and related states stay in sync. Mutations to this property trigger the appropriate UI updates in the picker and your application.

### Encoding and Decoding

The library encodes the emoji and its modifiers to the `emoji` key during persistence. This allows for accurate restoration of the user's choice, including any specific skin tone configuration they selected in the picker interface.
