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

Update the color or tint of a selection. The `setColor(_:)` method is the primary way to change an ``SymbolPicker/SPSelection`` color. 

### State Management

Since `SPSelection` is a struct, this is a mutating method. It updates the ``SymbolPicker/SPSelection/color`` property with your new value. If the selection ``SymbolPicker/SPSelection/type`` is `.color`, the selection itself changes. For symbols, emojis, or images, the color acts as a tint or background fill.

### UI Synchronization

Calling this method triggers any SwiftUI bindings associated with the selection. This causes the picker's preview and your application's UI to re-render with the new color immediately. This ensures the visual state always matches the underlying data model.
