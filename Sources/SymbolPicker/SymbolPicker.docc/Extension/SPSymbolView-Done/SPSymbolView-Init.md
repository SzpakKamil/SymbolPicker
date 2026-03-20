# ``SymbolPicker/SPSymbolView/init(symbol:)``

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

Initializes a new symbol view with a provided symbol model.

## Overview

The `init(symbol:)` initializer creates a reactive rendering component for a specific SF Symbol asset.

### Parameter Configuration

- **`symbol`**: The ``SymbolPicker/SPSymbol`` data model containing the symbol's naming, availability, and optional variant data.

### Initialization Process

Upon initialization, the view captures the necessary properties from the symbol model to prepare for rendering:
1. **Property Extraction**: Captures the symbol's ``SymbolPicker/SPSymbol/annotation``, ``SymbolPicker/SPSymbol/filledName``, and ``SymbolPicker/SPSymbol/notFilled`` names.
2. **Availability Capture**: Checks and stores the result of ``SymbolPicker/SPSymbol/isAvailable()`` to determine if a fallback icon is needed.
3. **Variant State**: Captures the preferred ``SymbolPicker/SPSymbol/Variant`` defined on the model.
