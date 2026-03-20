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

Initializes a new option list bound to a selection state.

## Overview

The `init(selection:)` initializer is used to create a new `SPOptionList` instance and bind it to the provided selection state.

### Environmental Dependencies

The initialized `SPOptionList` automatically resolves its aesthetic and behavioral state from the surrounding environment:
1. **Configuration**: Resolves a specific ``SymbolPicker/SPOptionListConfiguration`` for the current ``SymbolPicker/SPDisplayStyle`` (grid or row) to apply consistent styling.
2. **Dynamic Type**: Listens for changes in the system's dynamic type size to recalculate its adaptive grid layout.
3. **Asset Scope**: Respects the ``SymbolPicker/SPPageType`` to filter and display only relevant data categories.

### Parameters

- **`selection`**: A SwiftUI `Binding` to an ``SymbolPicker/SPSelection`` object. This binding allows the list to update the selected asset when a user interacts with it.
