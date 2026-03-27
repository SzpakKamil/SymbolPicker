# ``SymbolPicker/SymbolPicker/spColorPickerColors(_:)-(CKColor...)``

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

Supply a list of colors for the color picker.

## Overview

Pass multiple `CKColor` instances to populate the color selection grid. You control exactly which colors your users can choose by listing them as arguments. This modifier overrides the default palette and restricts the selection to your specified list.

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `colors` | `CKColor...` | The colors you want to show in the picker. |
