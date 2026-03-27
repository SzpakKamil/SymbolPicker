# ``SymbolPicker/SymbolPicker/spSelectionPreviewCalculateScale(_:)``

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

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Sets a custom scale calculation for the selection preview.

## Overview

Use this modifier to change the scale of the selection preview based on scroll geometry.

### Parameters

- **closure**: A closure that returns the scale based on current scroll data.

### Details

The closure receives the `ScrollGeometry` and returns a `CGFloat` for the scale. This allows the preview to shrink or grow dynamically as the user scrolls through the picker.
