# ``SymbolPicker/SPDataAsset/isSelection(of:)``

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

Checks if the asset matches the current selection.

- Parameter symbol: The asset to compare.
- Returns: `true` if identical to the selection; otherwise, `false`.

## Overview

The `isSelection(of:)` method helps the UI layer highlight the selected asset in the grid or list.

### UI Highlighting

``SymbolPicker/SPOptionList`` calls this method when it renders cells. If it returns `true`, the cell shows a selection indicator like a checkmark.

### Default Logic

The default implementation uses the `==` operator.

### Specialized Logic

Some types require custom logic. **SPSymbol** overrides this method to check if the current variant (filled or outlined) matches the provided symbol. This ensures the correct item highlights even when you switch variants.
