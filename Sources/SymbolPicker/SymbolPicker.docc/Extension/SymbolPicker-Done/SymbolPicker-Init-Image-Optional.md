# ``SymbolPicker/SymbolPicker/init(image:configuration:)-(Binding<SPImage?>,_)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.0")
    @Available(macOS, introduced: "14.0")
    @Available(visionOS, introduced: "26.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Creates a picker for an optional custom image.

## Overview

This initializer binds the picker to an optional image asset. It ensures the picker state stays in sync with your data.

### Parameters

- **image**: A binding to the optional ``SymbolPicker/SPImage`` object.
- **configuration**: The layout and style settings for the picker.

### Usage

The picker updates the provided binding when the user selects a photo. Use this version when your app allows a `nil` state for the selected image.
