# ``SymbolPicker/SymbolPicker/init(systemImage:ckColor:configuration:)-(Binding<String>,_,_)``

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

Creates a picker for a required SF Symbol name and a ColorKit color.

## Overview

This initializer binds the picker to a symbol name and a `CKColor`. It synchronizes the picker's state with your source of truth.

### Parameters

- **systemImage**: A binding to the SF Symbol name string.
- **ckColor**: A binding to a `CKColor` for the selection tint.
- **configuration**: The layout and style settings for the picker.

### Details

This version uses `CKColor` from ColorKit, making it ideal for cross-platform apps that manage colors consistently across iOS and macOS. The picker updates these bindings when the user selects a new symbol or tint.
