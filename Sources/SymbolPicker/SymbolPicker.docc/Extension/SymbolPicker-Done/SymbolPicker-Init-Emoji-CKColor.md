# ``SymbolPicker/SymbolPicker/init(emoji:ckColor:configuration:)-(Binding<SPEmoji>,_,_)``

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

Creates a picker for a required emoji and a ColorKit color.

## Overview

This initializer binds the picker to an emoji and a `CKColor`. It synchronizes the picker's state with your source of truth.

### Parameters

- **emoji**: A binding to the ``SymbolPicker/SPEmoji`` object.
- **ckColor**: A binding to a `CKColor` for the selection tint.
- **configuration**: The layout and style settings for the picker.

### Details

Use this version for cross-platform apps that manage colors through the ColorKit library. The picker updates these bindings when the user chooses an emoji or a new tint.
