# ``SymbolPicker/SPCategory/elements``

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

The list of assets in this category.

## Overview

The `elements` property holds all assets for a specific category section. Every item in the list must follow the ``SymbolPicker/SPDataAsset`` protocol.

### Sorting and Filtering

``SymbolPicker/SPDataManager`` cleans and sorts these assets before putting them in a category. This ensures you only see relevant results when searching or browsing.

### Rendering

The ``SymbolPicker/SPOptionList`` component uses this array to build the grid. Each asset displays itself using its ``SymbolPicker/SPDataAsset/asView()`` method.
