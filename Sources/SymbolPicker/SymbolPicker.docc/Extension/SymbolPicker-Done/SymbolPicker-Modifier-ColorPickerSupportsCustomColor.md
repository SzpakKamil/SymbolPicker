# ``SymbolPicker/SymbolPicker/spColorPickerSupportsCustomColor(_:)``

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

Allow users to select custom colors beyond the predefined palette.

## Overview

Enable this option to add a button that opens the system color picker. This gives users total control over the color selection, letting them choose any hue, saturation, or brightness. If you disable this, users can only pick from your specified or default color set.

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `value` | `Bool` | Set to `true` to enable custom color selection; `false` to restrict users to the palette. |
