# ``SymbolPicker/SPSpacing/Component/colorPicker``

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

The color picker component within the SymbolPicker.

## Overview

Selecting `.colorPicker` as the target component allows you to customize the dimensions and padding for the entire color selection area.

### Visual Impact

Modifying spacing for this component affects:
- **Cell Dimensions**: Controls the size of individual color circles or boxes.
- **Container Padding**: Adjusts the space around the entire color picker grid or row, providing more or less separation from the asset picker.
- **Dynamic Adaptation**: Since color pickers are often displayed on different platforms (e.g., as a row on iPhone or a grid on Apple Watch), adjusting these values ensures that the selection remains accessible and visually balanced.

### Default Behavior

By default, the `SymbolPicker` automatically scales the color cells based on the user's `DynamicTypeSize`. Overriding this allows you to enforce a specific design language or accommodate larger custom color sets.
