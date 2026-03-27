# ``SymbolPicker/SymbolPicker/init(emoji:color:configuration:)-(Binding<SPEmoji?>,_,_)``

Initialize a picker bound to an optional emoji and a SwiftUI color.

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

You create a `SymbolPicker` by passing bindings to an optional `SPEmoji` and a SwiftUI `Color`. This allows your emoji selection to be empty initially. The picker stays in sync with your source of truth, updating the bindings whenever the user picks an emoji or changes the color tint. Customize the picker's look using the `configuration` parameter.

### Parameters

- **emoji**: The binding to your optional emoji state.
- **color**: The binding to your SwiftUI `Color` for the tint.
- **configuration**: Settings that define the picker's look and behavior.
