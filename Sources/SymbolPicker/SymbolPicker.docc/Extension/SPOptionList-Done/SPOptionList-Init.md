# ``SymbolPicker/SPOptionList/init(selection:)``

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

You create a grid of assets linked to a selection binding.

## Overview

The `init(selection:)` initializer creates an `SPOptionList` and connects it to your selection state.

### Environmental Dependencies

The list resolves its look and behavior from the environment:
1. **Configuration**: it picks an ``SymbolPicker/SPOptionListConfiguration`` that matches your display style (grid or row).
2. **Dynamic Type**: It listens to system text size changes and recalculates the grid layout to keep icons legible.
3. **Asset Scope**: It reads the ``SymbolPicker/SPPageType`` to show only the assets that belong in the current category.

### Parameters

- **`selection`**: You provide a SwiftUI `Binding` to an ``SymbolPicker/SPSelection`` object. When a user taps an icon, the list updates this binding immediately.
