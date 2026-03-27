# ``SymbolPicker/SymbolPicker/init(systemImage:color:configuration:)-(Binding<String?>,_,_)``

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

Creates a picker for an optional SF Symbol name and a SwiftUI color.

## Overview

This initializer binds the picker to an optional symbol name and a tint color. It synchronizes the picker's state with your data.

### Parameters

- **systemImage**: A binding to the optional SF Symbol name string.
- **color**: A binding to a SwiftUI `Color` for the selection tint.
- **configuration**: The layout and style settings for the picker.

### Behavior

The picker updates the `systemImage` binding when the user selects a symbol. It updates the `color` binding when the user picks a new tint from the color palette.
