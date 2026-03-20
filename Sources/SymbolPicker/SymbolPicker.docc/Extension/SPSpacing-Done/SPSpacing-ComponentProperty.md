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

The `component` property serves as the unique identifier for a spacing configuration. It ensures that the sizing and padding rules defined within an ``SymbolPicker/SPSpacing`` object are applied only to the intended part of the `SymbolPicker` user interface.

### Targeting Logic

When the `SymbolPicker` renders its various views, it queries the current ``SymbolPicker/SymbolPickerConfiguration/spacings`` collection. It looks for a spacing object whose `component` property matches the view currently being laid out (e.g., ``SymbolPicker/SPSpacing/Component/colorPicker``).

### Uniqueness

In a standard configuration array, each ``SymbolPicker/SPSpacing/Component`` should ideally have only one corresponding spacing object. This clear mapping prevents layout conflicts and ensures that the picker's appearance is predictable across different screens and platforms.
