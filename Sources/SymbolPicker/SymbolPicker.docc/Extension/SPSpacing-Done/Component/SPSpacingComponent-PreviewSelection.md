# ``SymbolPicker/SPSpacing/Component/previewSelection``

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

The preview area showing the currently selected asset.

## Overview

Selecting `.previewSelection` as the target component allows you to customize the large preview area where the selected symbol, emoji, or image is prominently displayed.

### Visual Impact

Modifying spacing for this component affects:
- **Preview Dimensions**: Controls the size of the focal point in the `SPSelectionPreview`.
- **Center Alignment**: Adjusting width and height ensures the preview fits perfectly within its designated layout area, especially on platforms with limited screen space like watchOS.
- **Visual Breathing Room**: Customizing horizontal and vertical padding around the preview helps separate it from adjacent controls like the search bar or category picker.

### Adaptive Behavior

The preview selection area is often the most prominent part of the `SPSelectionPreview` configuration. By using dynamic sizing, you can ensure that the preview remains legible even when the user has set a very large dynamic type size.
