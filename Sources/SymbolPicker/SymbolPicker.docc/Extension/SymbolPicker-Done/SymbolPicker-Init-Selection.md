# ``SymbolPicker/SymbolPicker/init(selection:configuration:)-(Binding<SPSelection<DataAsset>>,_)``

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

Creates a picker bound to a selection object.

## Overview

This initializer binds the picker to an ``SymbolPicker/SPSelection`` instance. It synchronizes the picker's state with your source of truth.

### Parameters

- **selection**: A binding to the selection state.
- **configuration**: The layout and style settings for the picker.

### Usage

Use this initializer when you need full control over the selection data, including the asset type and its associated tint color. The picker updates the binding automatically when the user makes a choice.
