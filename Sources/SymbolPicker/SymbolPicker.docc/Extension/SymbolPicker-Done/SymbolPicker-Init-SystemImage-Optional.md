# ``SymbolPicker/SymbolPicker/init(systemImage:configuration:)-(Binding<String?>,_)``

Creates a picker bound to an optional SF Symbol name.

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

You use this initializer to link the picker to an optional string binding. When you select an SF Symbol, the picker updates the binding. If you change the binding value elsewhere in your code, the picker reflects that change immediately. This direct connection simplifies state management in your SwiftUI views.

### Parameters

- **systemImage**: A binding to the SF Symbol name string.
- **configuration**: The visual configuration for the picker.
