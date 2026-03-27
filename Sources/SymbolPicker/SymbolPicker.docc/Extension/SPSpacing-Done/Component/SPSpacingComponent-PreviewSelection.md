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

Targeting `.previewSelection` lets you customize the large preview area for selected symbols, emojis, or images.

### Visual Impact

Changing these values affects the focal point in `SPSelectionPreview`. You can adjust the width and height to fit the preview into tight layouts, such as those on Apple Watch. Adding horizontal and vertical padding separates the preview from the search bar and category picker.

### Adaptive Behavior

The preview area is a prominent part of the picker. By using dynamic sizing, you ensure the selected asset remains legible even when users set a large dynamic type size. This control helps maintain the visual hierarchy of the `SPSelectionPreview` across all Apple platforms.
