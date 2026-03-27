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

Updates the selection's color.

- Parameter color: The new `CKColor` to apply.

## Overview

The `setColor(_:)` method modifies the color component of a selection. As a `mutating` requirement, it updates the internal state of conforming structs like ``SymbolPicker/SPSelection``.

### Logic

Conforming types handle this method based on their selection rules. For `SPSelection`, it updates the `color` property. If the selection was previously undefined, it may also update the selection type.

### UI Interaction

The ``SymbolPicker/SPColorPicker`` calls this method when a user taps a color cell. Updating the color triggers a re-render of dependent views like the preview area.
