# ``SymbolPicker/SPSelection/SelectionType``

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

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

An enumeration for assets in SymbolPicker.

## Overview

The `SelectionType` enum tells an ``SymbolPicker/SPSelection`` object which asset is active. It controls whether the UI renders a symbol, emoji, image, or color.

### Supported Types

- **Symbol**: A vector asset, usually ``SymbolPicker/SPSymbol``.
- **Emoji**: A native character via ``SymbolPicker/SPEmoji``.
- **Image**: A custom photo via ``SymbolPicker/SPImage``.
- **Color**: A solid color via `CKColor`.

### Data Integrity

`SelectionType` scopes the logic for rendering and equality. It also tells the `Codable` implementation how to save and restore the selection.

## Topics

### Asset Types

- ``SymbolPicker/SPSelection/SelectionType/symbol``
- ``SymbolPicker/SPSelection/SelectionType/emoji``
- ``SymbolPicker/SPSelection/SelectionType/image``
- ``SymbolPicker/SPSelection/SelectionType/color``
