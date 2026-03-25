# ``SymbolPicker/SPSelection/init(systemName:ckColor:)``

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

Initializes a selection with a system symbol name and an optional platform-agnostic color.

- Parameters:
  - systemName: The SF Symbol name to use for the selection.
  - ckColor: An optional `ColorKit/CKColor` to apply as a tint. Defaults to `nil`.

## Overview

This initializer provides a direct way to create a symbol selection with a pre-configured `ColorKit/CKColor`.

### Internal asset generation

When this initializer is called, the library creates a new ``SymbolPicker/SPSymbol`` instance with identical filled and outlined names based on the provided `systemName`.

### Platform Agnostic Color

By using `ColorKit/CKColor` directly, this initializer ensures that the selection's color state is ready for use across all supported platforms without further conversion.
