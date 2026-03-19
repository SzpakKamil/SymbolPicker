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

An array containing all the ``SymbolPicker/SPDataAsset`` objects belonging to this category.

## Overview

The `elements` property holds the actual content that is displayed in each category's section in the picker. Each element in this array must conform to the ``SymbolPicker/SPDataAsset`` protocol.

### Sorting and Filtering

The assets within this array are typically pre-filtered by the ``SymbolPicker/SPDataManager`` before being added to a category. This ensures that only available and relevant assets (based on searching or category grouping) are present.

### Rendering

During the rendering process in components like ``SymbolPicker/SPOptionList``, the `elements` array is used to populate the grid or list for each category header. Each asset's visual representation is obtained by calling its ``SymbolPicker/SPDataAsset/asView()`` method.
