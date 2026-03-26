# ``SymbolPicker/SymbolPicker/init(image:configuration:)-(Binding<SPImage?>,_)``

Creates a picker bound to an optional custom image.

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
- **configuration**: The visual configuration for the picker.
