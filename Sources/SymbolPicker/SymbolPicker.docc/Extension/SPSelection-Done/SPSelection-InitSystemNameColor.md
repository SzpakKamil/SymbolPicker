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

This initializer provides a convenient way to create a symbol selection using standard SF Symbol names and SwiftUI colors.

### Automatic Asset Creation

When this initializer is called, the library creates a new ``SymbolPicker/SPSymbol`` instance with identical filled and outlined names based on the provided `systemName`.

### Color Conversion

The provided SwiftUI `Color` is automatically converted into a `ColorKit/CKColor` for storage within the selection. This ensures that the color is compatible with all platforms supported by the library.
