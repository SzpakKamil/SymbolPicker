# ``SymbolPicker/SymbolPicker/init(image:color:configuration:)-(Binding<SPImage>,_,_)``

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

Creates a picker for a required custom image and a SwiftUI color.

## Overview

This initializer binds the picker to a required image and a color. It synchronizes the selection state with your source of truth.

### Parameters

- **image**: A binding to the ``SymbolPicker/SPImage`` object.
- **color**: A binding to a SwiftUI `Color` for the selection tint.
- **configuration**: The layout and style settings for the picker.

### Behavior

The picker updates these bindings as the user selects a photo or changes the tint color. Use this version when your data model requires a non-optional image.
