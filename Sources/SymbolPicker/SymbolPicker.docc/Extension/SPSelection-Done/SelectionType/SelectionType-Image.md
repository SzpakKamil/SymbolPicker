# ``SymbolPicker/SPSelection/SelectionType/image``

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

Indicates that the selection is a custom photo or image asset.

## Overview

When the `type` of an ``SymbolPicker/SPSelection`` is set to `.image`, the selection logic targets the ``SymbolPicker/SPSelection/image`` property. This type is primarily used for custom photos from the Photos library on iOS and macOS.

### User Interaction and Customization

Unlike static symbols or emojis, `.image` selections offer an interactive customization layer:
- **Spatial Adjustments**: Users can modify the image's **scale** (zoom) and **offset** (X and Y positions) to perfectly frame their content.
- **Dynamic Styling**: The selection's color is automatically synced to the image's average color, creating a unified look for the selection preview and any associated UI elements.

### Data Handling

In this state:
- The `image` property contains the active asset (e.g., ``SymbolPicker/SPImage``).
- The `asView()` method renders the image using its specialized view (e.g., ``SymbolPicker/SPImageView``), applying any user adjustments for scale and offset.
- Custom images can be persisted by encoding their identifier, adjustment parameters, and calculated color.

### UI Integration

The `SymbolPicker` displays a custom image browser when this type is active, presenting a grid of available image assets for selection.
