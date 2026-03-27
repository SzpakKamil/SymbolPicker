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

Initialize a symbol selection with an SF Symbol name and a platform-agnostic color. This method provides a direct path to symbol selections with pre-configured colors.

### Asset Creation

This initializer creates an ``SymbolPicker/SPSymbol`` instance with identical filled and outlined names based on your `systemName`. It prepares the asset for use within the picker's modular architecture.

### Color Readiness

By using `ColorKit/CKColor` directly, you ensure the color state is ready for every supported platform. This eliminates the overhead of SwiftUI `Color` conversion during selection rendering on macOS or watchOS.
