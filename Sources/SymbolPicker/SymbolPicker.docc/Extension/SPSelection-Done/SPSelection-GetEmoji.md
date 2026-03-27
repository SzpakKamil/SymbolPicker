# ``SymbolPicker/SPSelection/getEmoji()``

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

Returns the emoji character data for the selection.

- Returns: The ``SymbolPicker/SPEmoji`` assigned to the selection, or `nil` if the selection type is not `.emoji`.

## Overview

Get the emoji data for a selection. The `getEmoji()` method returns an ``SymbolPicker/SPEmoji`` or `nil` if the selection type is not `.emoji`. 

### Manual Rendering

This method provides safe access to the character and its skin tone variation. Use it when you need to render the selected emoji manually. For example, you might want to apply custom fonts, animations, or specialized modifiers that aren't part of the standard ``SymbolPicker/SPEmojiView``. It ensures you have the raw data needed for custom SwiftUI components.
