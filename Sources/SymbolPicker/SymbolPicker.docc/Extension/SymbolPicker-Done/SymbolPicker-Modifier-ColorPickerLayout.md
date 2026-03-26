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

Configures the layout of the color picker.

## Overview

Use this modifier to set the direction and spacing of the color picker's elements.

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `type` | `SPColorPickerConfiguration.Direction` | The layout direction (horizontal or vertical). |
| `spacing` | `CGFloat?` | The optional spacing between color items. |
