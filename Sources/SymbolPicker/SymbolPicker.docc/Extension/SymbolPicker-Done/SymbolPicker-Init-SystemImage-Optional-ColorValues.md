# ``SymbolPicker/SymbolPicker/init(systemImage:colorValues:configuration:)-(Binding<String?>,_,_)``

Creates a picker bound to an optional SF Symbol name and raw RGBA color values.

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

## Overview

This initializer provides a specialized binding for the asset selection, ensuring that the picker state is automatically synchronized with the provided source of truth.

### Parameters

- **systemImage**: A binding to the SF Symbol name string.
- **colorValues**: A binding to an array of doubles representing RGBA components.
- **configuration**: The visual configuration for the picker.
