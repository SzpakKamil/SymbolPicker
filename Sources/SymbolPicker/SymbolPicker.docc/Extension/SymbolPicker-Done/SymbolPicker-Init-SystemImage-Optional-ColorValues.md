# ``SymbolPicker/SymbolPicker/init(systemImage:colorValues:configuration:)-(Binding<String?>,_,_)``

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

Creates a picker for an optional SF Symbol name and RGBA color values.

## Overview

This initializer binds the picker to an optional symbol name and raw color components. It synchronizes the picker's state with your source of truth.

### Parameters

- **systemImage**: A binding to the optional SF Symbol name string.
- **colorValues**: A binding to an array of doubles for RGBA components.
- **configuration**: The layout and style settings for the picker.

### Usage

Use this version when your data model allows for no selected symbol and stores colors as raw doubles. The picker updates these bindings as the user interacts with the interface.
