# ``SymbolPicker/SPSelectionProtocol/setColor(_:)``

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

Updates the color component of the current selection.

- Parameter color: The new `CKColor` to apply to the selection.

## Overview

The `setColor(_:)` method is used to modify the color of a selection. It is a `mutating` requirement, meaning that when implemented by a struct (like ``SymbolPicker/SPSelection``), it can update the struct's internal state.

### Implementation Logic

Conforming types should handle this method according to their selection logic:
- **SPSelection**: When `setColor(_:)` is called, it updates its internal `color` property and potentially its `type` if the selection was previously undefined or if it represents a standalone color choice.

### UI Interaction

This method is primarily called by the ``SymbolPicker/SPColorPicker`` when a user taps a color cell. By updating the selection's color, it triggers any dependent UI components (like the preview area) to re-render with the new color.
