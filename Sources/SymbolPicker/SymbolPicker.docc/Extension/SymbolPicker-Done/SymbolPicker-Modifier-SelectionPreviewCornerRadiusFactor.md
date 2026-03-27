# ``SymbolPicker/SymbolPicker/spSelectionPreviewCornerRadiusFactor(_:)``

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

Sets the corner radius factor for the selection preview.

## Overview

Use this modifier to round the corners of the preview area that shows the selected symbol.

### Parameters

- **value**: The corner radius factor to use.

### Details

The factor multiplies the preview's width to calculate the final corner radius. This keeps the rounding proportional as the preview area changes size.
