# ``SymbolPicker/SPSymbol/Variant``

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

An enumeration defining the visual style of an SF Symbol.

## Overview

The `Variant` enum allows developers to switch between the two primary visual styles supported by SF Symbols: filled and outlined. This abstraction provides a consistent way to manage icon styles throughout the library and the application's UI.

### Abstracting SF Symbol Naming

Rather than manually appending `.fill` to system names, this enumeration encapsulates the visual state. This is particularly useful when:
- **Global Styling**: Applying a consistent visual style across all icons in the picker.
- **Dynamic Previews**: Allowing users to toggle between styles in real-time.
- **Type Safety**: Ensuring that only valid visual states are requested from the `SPSymbol` instance.

### Platform Support

As an core component of the symbol management system, the `Variant` enum is available across all platforms supported by the package, ensuring a unified API for symbol style management on iOS, macOS, and beyond.

## Topics

### Style Cases

- ``SymbolPicker/SPSymbol/Variant/filled``
- ``SymbolPicker/SPSymbol/Variant/outlined``

### Instance Properties

- ``SymbolPicker/SPSymbol/Variant/id``
