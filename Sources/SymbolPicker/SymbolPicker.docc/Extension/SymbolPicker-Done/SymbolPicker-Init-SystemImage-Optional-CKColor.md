# ``SymbolPicker/SymbolPicker/init(systemImage:ckColor:configuration:)-(Binding<String?>,_,_)``

Initialize a picker bound to an optional SF Symbol name and a ColorKit color.

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

You create a `SymbolPicker` by passing bindings to an optional `String` for the symbol name and a `CKColor` for the tint. This setup allows your state to start as `nil` when no symbol is selected. The picker automatically synchronizes its internal state with your bindings, updating them as soon as the user makes a selection. Use the `configuration` parameter to customize the picker's appearance.

### Parameters

- **systemImage**: The binding to your optional SF Symbol name.
- **ckColor**: The binding to your `CKColor` state.
- **configuration**: Settings that define the picker's layout and style.
