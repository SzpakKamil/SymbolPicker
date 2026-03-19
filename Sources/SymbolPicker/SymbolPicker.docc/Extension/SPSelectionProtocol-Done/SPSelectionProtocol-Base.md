# ``SymbolPicker/SPSelectionProtocol``

A foundational protocol that defines the common interface for user selections within the SymbolPicker, abstracting symbols, emojis, custom images, and colors.

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

## Overview

`SPSelectionProtocol` is the core abstraction for any type of content selected by a user via the ``SymbolPicker/SymbolPicker``. It ensures that regardless of whether the user chose a symbol, an emoji, a custom photo, or a specific color, the rest of the application can interact with that selection through a unified set of methods and properties.

The protocol provides:
- **Unified Data Access**: Retrieve or update the color (``SymbolPicker/SPSelectionProtocol/getColor()`` / ``SymbolPicker/SPSelectionProtocol/setColor(_:)``) or custom image (``SymbolPicker/SPSelectionProtocol/getImage()`` / ``SymbolPicker/SPSelectionProtocol/setImage(_:)``) regardless of the underlying storage model.
- **Availability Checking**: The ``SymbolPicker/SPSelectionProtocol/isContentAvailable()`` method allows the system to verify if the selected content is supported on the current platform before attempting to render it.
- **Visual Representation**: The ``SymbolPicker/SPSelectionProtocol/asView()`` method allows the selection to render itself as a SwiftUI `AnyView`, enabling generic preview components to display any selection type correctly.

### Implementation

The primary implementation of this protocol is the generic ``SymbolPicker/SPSelection`` struct. This struct uses an internal enumeration to manage the different selection states while conforming to `SPSelectionProtocol` to provide a consistent external API.

### Type Erasure

In many parts of the `SymbolPicker` package, `SPSelectionProtocol` is used with type erasure (`any SPSelectionProtocol`). This is particularly important for the ``SymbolPicker/SymbolPickerStyle`` and environment values, where the system needs to handle selections without knowing the specific `DataAsset` type at compile time.

## Topics

### Data Access & Modification
Methods for retrieving and updating the content of the selection.

- ``SymbolPicker/SPSelectionProtocol/getColor()``
- ``SymbolPicker/SPSelectionProtocol/setColor(_:)``
- ``SymbolPicker/SPSelectionProtocol/getImage()``
- ``SymbolPicker/SPSelectionProtocol/setImage(_:)``

### Availability & Status
Methods for checking the current state of the selection's content.

- ``SymbolPicker/SPSelectionProtocol/isContentAvailable()``

### UI Representation
Methods for rendering the selection in the user interface.

- ``SymbolPicker/SPSelectionProtocol/asView()``
