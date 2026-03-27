# ``SymbolPicker/SymbolPicker/spColorPickerLayout(_:spacing:)``

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

Sets the direction and spacing for the color picker.

## Overview

Use this modifier to control the color picker's layout.

### Parameters

- **type**: The layout direction—horizontal or vertical.
- **spacing**: The space between color items.

### Layout Options

The `type` parameter accepts `SPColorPickerConfiguration.Direction` values like `.grid` or `.row`. Spacing uses a `CGFloat` value to set the gap between cells.
