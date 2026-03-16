# ``SwiftUICore/EnvironmentValues/spAllowsColorSelection``

A Boolean value that determines whether the color picker is available for the selected symbol or emoji.

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

When set to `true`, users can select a color for the chosen asset. When `false`, the color selection interface is hidden.

This property takes effect when you use the `SymbolPicker` initializers or `.symbolPicker` view modifiers that do not require an `SPSelection` type. It serves as a mechanism for the `SymbolPicker` to enforce a specific presentation and appearance without overriding the `SymbolPickerConfiguration` implementations.

> Important: This property is read-only within the picker's view hierarchy. For customization of the picker's behavior and appearance, it is recommended to use the properties available in `SymbolPickerConfiguration`.

### End User Impact

This provides developers with control over whether users can apply custom colors to symbols or emojis, ensuring that the selected assets adhere to the design constraints of the application.
