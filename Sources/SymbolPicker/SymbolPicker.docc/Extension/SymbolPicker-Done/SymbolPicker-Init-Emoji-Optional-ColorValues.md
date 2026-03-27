# ``SymbolPicker/SymbolPicker/init(emoji:colorValues:configuration:)-(Binding<SPEmoji?>,_,_)``

Creates a picker bound to an optional emoji and raw RGBA color values.

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

Link the picker to an emoji binding and an array of RGBA color values. You receive the selected emoji and its color as raw doubles. This approach works well for apps that store colors in databases or transfer them over a network. The picker synchronizes the UI state with your provided bindings.

### Parameters

- **emoji**: A binding to the emoji object.
- **colorValues**: A binding to an array of doubles representing RGBA components.
- **configuration**: The visual configuration for the picker.
