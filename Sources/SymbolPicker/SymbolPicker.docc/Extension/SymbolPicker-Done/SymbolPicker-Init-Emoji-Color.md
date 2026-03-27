# ``SymbolPicker/SymbolPicker/init(emoji:color:configuration:)-(Binding<SPEmoji>,_,_)``

Initialize a picker bound to a required emoji and a SwiftUI color.

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

You create a `SymbolPicker` by passing bindings to an `SPEmoji` and a SwiftUI `Color`. This setup ensures your data model stays in sync as the user chooses new emojis or adjusts the tint. The picker updates your source of truth immediately upon any selection. Use the `configuration` parameter to control the picker's layout and style.

### Parameters

- **emoji**: The binding to your emoji state.
- **color**: The binding to your SwiftUI `Color` for the tint.
- **configuration**: Settings that define the picker's look and behavior.
