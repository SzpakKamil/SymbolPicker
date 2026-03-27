# ``SymbolPicker/SPSelection/init(emoji:ckColor:)``

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

Initializes a selection with an emoji and an optional platform-agnostic color.

- Parameters:
  - emoji: The ``SymbolPicker/SPEmoji`` to use as the selection.
  - ckColor: An optional `ColorKit/CKColor` to apply as a tint. Defaults to `nil`.

## Overview

Initialize an emoji selection with a platform-agnostic color. Use this initializer to create an emoji selection using a `ColorKit/CKColor` directly. 

### Selection State

This method sets the selection ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/emoji``. It populates the ``SymbolPicker/SPSelection/emoji`` property with the provided character data.

### Direct Storage

Direct `ColorKit/CKColor` storage keeps the selection's color state ready for all platforms. This avoids the need for runtime conversion from SwiftUI `Color`, ensuring your emoji tints and backgrounds render correctly on every supported OS.
