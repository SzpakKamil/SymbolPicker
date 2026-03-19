# ``SymbolPicker/SPSelectionProtocol/getColor()``

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

Retrieves the color associated with the current selection.

- Returns: A `CKColor` if a color is set for the selection; otherwise, `nil`.

## Overview

The `getColor()` method provides a standardized way to access the color component of any user selection. This is particularly useful for components that need to display or manipulate the selection's color, regardless of whether the selection is a symbol with a specific tint or a standalone color choice.

### Use Cases

- **Color Pickers**: Used by the ``SymbolPicker/SPColorPicker`` to determine the currently selected color and highlight the corresponding cell in its grid or row.
- **Selection Previews**: Used by preview components to apply the correct color when rendering symbols or to show a color block for color-only selections.
- **Styling**: Can be used by hosting applications to theme their own UI based on the user's current selection.
