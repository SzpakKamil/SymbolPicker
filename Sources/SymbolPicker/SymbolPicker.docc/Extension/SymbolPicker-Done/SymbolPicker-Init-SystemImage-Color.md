# ``SymbolPicker/SymbolPicker/init(systemImage:color:configuration:)-(Binding<String>,_,_)``

Initialize a picker bound to a required SF Symbol name and a SwiftUI color.

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

You create a `SymbolPicker` by passing bindings to a `String` for the symbol name and a SwiftUI `Color` for the tint. This setup keeps the picker in sync with your data model. When a user picks a symbol or changes the color, the bindings update immediately. Use the `configuration` parameter to customize the picker's layout and style.

### Parameters

- **systemImage**: The binding to your SF Symbol name state.
- **color**: The binding to your SwiftUI `Color` for the tint.
- **configuration**: Settings that define the picker's layout and behavior.
