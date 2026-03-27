# ``SymbolPicker/SymbolPicker/spSelectionPreviewCalculateOffset(_:)``

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

Sets a custom offset calculation for the selection preview.

## Overview

Use this modifier to change the position of the selection preview based on scroll geometry.

### Parameters

- **closure**: A closure that returns the offset based on current scroll data.

### Details

The closure receives the `ScrollGeometry` and returns a `CGFloat` for the offset. This allows the preview to move dynamically as the user scrolls through the picker.
