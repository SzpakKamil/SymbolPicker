# ``SymbolPicker/SPSpacing/component``

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

The UI component that this spacing configuration applies to.

## Overview

The `component` property identifies which part of the interface a spacing configuration targets. It ensures `SymbolPicker` applies your sizing and padding rules only to the correct view.

### Targeting Logic

When rendering views, `SymbolPicker` queries the ``SymbolPicker/SymbolPickerConfiguration/spacings`` collection. It looks for a spacing object with a `component` property that matches the view currently being laid out, such as the color picker or the asset grid.

### Layout Predictability

Each ``SymbolPicker/SPSpacing/Component`` should have only one corresponding spacing object in your configuration array. This direct mapping prevents layout conflicts and keeps the picker's appearance predictable across different screens and platforms.
