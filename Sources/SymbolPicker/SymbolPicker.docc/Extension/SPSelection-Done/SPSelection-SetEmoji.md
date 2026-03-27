# ``SymbolPicker/SPSelection/setEmoji(_:)``

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

Updates the selection to a standard emoji character.

- Parameter emoji: The new ``SymbolPicker/SPEmoji`` to set as the selection.

## Overview

Update the current selection to an emoji character. The `setEmoji(_:)` method switches the selection ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/emoji`` and refreshes the underlying data.

### Mutating State

Calling this method clears any existing symbol or custom image data by setting those properties to `nil`. It updates the ``SymbolPicker/SPSelection/emoji`` property with the new character and its skin tone configuration.

### UI Feedback

`SymbolPicker` calls this method when a user picks an emoji from the browser. This ensures the selection binding in your app stays in sync with the user's choice.
