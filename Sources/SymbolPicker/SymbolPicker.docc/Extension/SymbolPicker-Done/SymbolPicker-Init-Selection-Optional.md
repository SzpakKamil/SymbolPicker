# ``SymbolPicker/SymbolPicker/init(selection:configuration:)-(Binding<SPSelection<DataAsset>?>,_)``

Initialize a picker with an optional generic selection.

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

Create a `SymbolPicker` using a binding to an optional `SPSelection`. This setup allows your state to start as `nil` when no asset is selected. The picker automatically synchronizes its internal state with your binding. When a user picks an asset, the binding updates; if they clear the selection, it returns to `nil`.

### Parameters

- **selection**: The binding to your optional selection state.
- **configuration**: The layout and style settings for the picker.
