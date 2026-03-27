# ``SymbolPicker/SPSelection/init(systemName:color:)``

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

Initializes a selection with a system symbol name and an optional SwiftUI color.

- Parameters:
  - systemName: The SF Symbol name to use for the selection.
  - color: An optional SwiftUI `Color` to apply as a tint. Defaults to `nil`.

## Overview

Initialize a selection using an SF Symbol name and an optional SwiftUI color. This provides a fast way to build symbol selections with standard names.

### Asset Creation

This initializer creates an ``SymbolPicker/SPSymbol`` instance with identical filled and outlined names based on your `systemName`. It sets the selection type to symbol and prepares the asset for rendering.

### Color Conversion

The library converts the SwiftUI `Color` into a `ColorKit/CKColor` for storage. This ensures platform compatibility and allows the selection to work seamlessly across iOS, macOS, and watchOS.
