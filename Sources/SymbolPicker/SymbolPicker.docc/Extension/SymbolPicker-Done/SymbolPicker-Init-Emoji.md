# ``SymbolPicker/SymbolPicker/init(emoji:configuration:)-(Binding<SPEmoji>,_)``

Initialize a picker bound to a required emoji selection.

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

You create a `SymbolPicker` by passing a binding to an `SPEmoji`. This ensures the picker remains in sync with your data model. When you choose a new emoji, the binding updates your state immediately. Use the `configuration` parameter to customize how the picker looks and behaves.

### Parameters

- **emoji**: The binding to your emoji state.
- **configuration**: Settings that define the picker's layout and style.
