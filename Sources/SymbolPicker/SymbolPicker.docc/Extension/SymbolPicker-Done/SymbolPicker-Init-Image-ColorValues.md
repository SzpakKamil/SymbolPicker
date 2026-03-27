# ``SymbolPicker/SymbolPicker/init(image:colorValues:configuration:)-(Binding<SPImage>,_,_)``

Initialize a picker with a required custom image and raw RGBA color values.

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

You create a `SymbolPicker` by passing bindings to an `SPImage` and an array of `Double` values for RGBA components. This ensures your data model stays in sync as the user chooses new images or adjusts colors. The picker updates your source of truth immediately upon any selection. Use the `configuration` parameter to control the picker's appearance and behavior.

### Parameters

- **image**: The binding to your custom image selection.
- **colorValues**: The binding to your RGBA color component array.
- **configuration**: Settings that define the picker's layout and style.
