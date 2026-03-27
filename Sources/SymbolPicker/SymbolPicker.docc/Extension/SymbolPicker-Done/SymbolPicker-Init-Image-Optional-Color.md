# ``SymbolPicker/SymbolPicker/init(image:color:configuration:)-(Binding<SPImage?>,_,_)``

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

Creates a picker for an optional custom image and a SwiftUI color.

## Overview

This initializer binds the picker to an optional image and a color. It synchronizes the picker's internal state with your source of truth.

### Parameters

- **image**: A binding to the optional ``SymbolPicker/SPImage`` object.
- **color**: A binding to a SwiftUI `Color` for the selection tint.
- **configuration**: The layout and style settings for the picker.

### Usage

Use this initializer when you need to store both a custom photo and its associated tint color in your app's state. The picker automatically updates these bindings when the user makes a selection or changes the tint.
