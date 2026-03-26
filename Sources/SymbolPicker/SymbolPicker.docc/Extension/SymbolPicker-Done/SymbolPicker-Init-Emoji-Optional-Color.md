# ``SymbolPicker/SymbolPicker/init(emoji:color:configuration:)-(Binding<SPEmoji?>,_,_)``

Creates a picker bound to an optional emoji and a SwiftUI color.

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

This initializer provides a specialized binding for the asset selection, ensuring that the picker state is automatically synchronized with the provided source of truth.

### Parameters

- **emoji**: A binding to the emoji object.
- **color**: A binding to a SwiftUI `Color` for representing the selection's tint.
- **configuration**: The visual configuration for the picker.
