# ``SymbolPicker/SymbolPicker/init(image:configuration:)-(Binding<SPImage>,_)``

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

Creates a picker for a required custom image.

## Overview

This initializer binds the picker to a non-optional image asset. It ensures the picker state stays in sync with your data.

### Parameters

- **image**: A binding to the ``SymbolPicker/SPImage`` object.
- **configuration**: The layout and style settings for the picker.

### Implementation

The picker uses the provided binding to update the selected image. This version is ideal for views where an image must always be selected, preventing `nil` states in your data model.
