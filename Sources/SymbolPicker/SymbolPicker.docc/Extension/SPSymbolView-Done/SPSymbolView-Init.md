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

You create a view to render a specific SF Symbol.

## Overview

The `init(symbol:)` initializer prepares your `SPSymbol` data for the screen. It sets up a reactive component that handles the rendering details for the chosen icon.

### Parameter Configuration

- **`symbol`**: You provide the ``SymbolPicker/SPSymbol`` model. This contains the symbol's name, availability, and variant options.

### Initialization Process

When you call this, the view extracts key details from your model:
1. **Property Extraction**: It captures the annotation and the different names for filled and outline states.
2. **Availability Check**: It runs ``SymbolPicker/SPSymbol/isAvailable()``. If the icon doesn't exist on the user's OS version, the view prepares a fallback icon.
3. **Variant Setup**: It captures your preferred variant style from the model.
