# ``SymbolPicker/SPSelectionProtocol``

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

A protocol defining the interface for user selections.

## Overview

`SPSelectionProtocol` abstracts symbols, emojis, images, and colors. It ensures the rest of your app can interact with any user choice through a unified set of methods.

The protocol provides:
- **Data Access**: Get or set the color (``SymbolPicker/SPSelectionProtocol/getColor()``) or custom image (``SymbolPicker/SPSelectionProtocol/getImage()``) regardless of the storage model.
- **Status**: Use ``SymbolPicker/SPSelectionProtocol/isContentAvailable()`` to verify the current platform supports the selection.
- **Rendering**: Use ``SymbolPicker/SPSelectionProtocol/asView()`` to render the selection as a SwiftUI view.

### Implementation

The generic ``SymbolPicker/SPSelection`` struct is the primary implementation. It uses an internal enum to manage states while following `SPSelectionProtocol` for its public API.

### Type Erasure

The library often uses this protocol with type erasure (`any SPSelectionProtocol`). This lets the ``SymbolPicker/SymbolPicker`` and environment values handle selections without knowing the asset type at compile time.

## Topics

### Data Access
- ``SymbolPicker/SPSelectionProtocol/getColor()``
- ``SymbolPicker/SPSelectionProtocol/setColor(_:)``
- ``SymbolPicker/SPSelectionProtocol/getImage()``
- ``SymbolPicker/SPSelectionProtocol/setImage(_:)``

### Status
- ``SymbolPicker/SPSelectionProtocol/isContentAvailable()``

### UI Representation
- ``SymbolPicker/SPSelectionProtocol/asView()``
