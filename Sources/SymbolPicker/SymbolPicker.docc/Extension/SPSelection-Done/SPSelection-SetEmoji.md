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

The `setEmoji(_:)` method switches the current ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/emoji`` and updates the underlying emoji data.

### Mutating State

When this method is called:
- The ``SymbolPicker/SPSelection/type`` is set to `.emoji`.
- The ``SymbolPicker/SPSelection/emoji`` property is updated with the new character and its skin tone configuration.
- Any existing symbol or custom image data is cleared by setting those properties to `nil`.

### UI Feedback

This method is commonly called by the `SymbolPicker` when a user interacts with the emoji browser, ensuring that the selection binding in your app is updated with the correct emoji character.
