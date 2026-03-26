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

Configures a custom scale calculation for the selection preview based on scroll geometry.

## Overview

Use this modifier to dynamically adjust the scale of the selection preview as the user scrolls through the picker.

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `closure` | `(ScrollGeometry) -> CGFloat` | A closure that calculates the scale based on the current scroll geometry. |
