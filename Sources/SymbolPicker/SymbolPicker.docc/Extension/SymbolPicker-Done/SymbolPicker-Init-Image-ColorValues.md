# ``SymbolPicker/SymbolPicker/init(image:colorValues:configuration:)-(Binding<SPImage>,_,_)``

Creates a picker bound to a non-optional custom image and raw RGBA color values.

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

## Overview

This initializer provides a specialized binding for the asset selection, ensuring that the picker state is automatically synchronized with the provided source of truth.

### Parameters

- **image**: A binding to the custom image object.
- **colorValues**: A binding to an array of doubles representing RGBA components.
- **configuration**: The visual configuration for the picker.
