# ``SymbolPicker/SymbolPicker/init(emoji:ckColor:configuration:)-(Binding<SPEmoji?>,_,_)``

Creates a picker bound to an optional emoji and a ColorKit color.

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

This initializer connects the picker to an emoji binding and a `CKColor` binding. You manage both the selected emoji and its associated color through these two sources of truth. The picker updates both bindings as you interact with the UI. Use this initializer when your app relies on ColorKit for color management.

### Parameters

- **emoji**: A binding to the emoji object.
- **ckColor**: A binding to a `CKColor` for representing the selection's tint.
- **configuration**: The visual configuration for the picker.
