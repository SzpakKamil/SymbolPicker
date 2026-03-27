# ``SymbolPicker/SymbolPicker/init(image:ckColor:configuration:)-(Binding<SPImage>,_,_)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.0")
    @Available(macOS, introduced: "14.0")
    @Available(visionOS, introduced: "26.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Creates a picker for a required custom image and a ColorKit color.

## Overview

This initializer binds the picker to a required image and a `CKColor`. It synchronizes the picker's state with your source of truth.

### Parameters

- **image**: A binding to the ``SymbolPicker/SPImage`` object.
- **ckColor**: A binding to a `CKColor` for the selection tint.
- **configuration**: The layout and style settings for the picker.

### Usage

Use this version for cross-platform apps that require a selected photo. The picker updates these bindings when the user chooses a new image or tint.
