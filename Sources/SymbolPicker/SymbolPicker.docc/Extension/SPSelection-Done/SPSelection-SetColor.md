# ``SymbolPicker/SPSelection/setColor(_:)``

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

Updates the color or tint associated with the selection.

- Parameter color: The new `ColorKit/CKColor` to apply to the selection.

## Overview

The `setColor(_:)` method is the primary way to update the color of an existing ``SymbolPicker/SPSelection``. Because `SPSelection` is a struct, this is a mutating method.

### State Updates

When this method is called:
- The ``SymbolPicker/SPSelection/color`` property is updated with the new value.
- If the current ``SymbolPicker/SPSelection/type`` is `.color`, the selection itself is updated.
- If the type is `.symbol`, `.emoji`, or `.image`, the color is updated as a tint.

### Data Flow

Calling this method triggers any SwiftUI bindings associated with the selection, causing the picker's preview and the application's UI to re-render with the new color immediately.
