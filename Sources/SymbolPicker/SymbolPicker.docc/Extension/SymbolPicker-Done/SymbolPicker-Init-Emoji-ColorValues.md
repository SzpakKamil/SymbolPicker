# ``SymbolPicker/SymbolPicker/init(emoji:colorValues:configuration:)-(Binding<SPEmoji>,_,_)``

Initialize a picker bound to a required emoji and raw RGBA color values.

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

You create a `SymbolPicker` by passing bindings to an `SPEmoji` and an array of `Double` values representing RGBA components. This ensures the picker directly updates your data model's color components. When you choose a new emoji or adjust the color, the picker syncs the changes to your bindings immediately. Use the `configuration` parameter to define the picker's style.

### Parameters

- **emoji**: The binding to your emoji state.
- **colorValues**: The binding to your RGBA color component array.
- **configuration**: Settings that define the picker's layout and style.
