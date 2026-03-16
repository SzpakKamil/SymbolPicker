# ``SwiftUICore/EnvironmentValues/spAllowedPageTypes``

An array of `SPPageType` that specifies which pages (e.g., symbols, emojis) are available to the user.

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

Use this property to dynamically control which data categories are accessible within the symbol picker. For example, you can limit the picker to only show symbols by setting this value to `[.symbol]`.

This property takes effect when you use the `SymbolPicker` initializers or `.symbolPicker` view modifiers that do not require an `SPSelection` type. It serves as a mechanism for the `SymbolPicker` to enforce a specific presentation and appearance without overriding the `SymbolPickerConfiguration` implementations.

> Important: This property is read-only within the picker's view hierarchy. For customization of the picker's behavior and appearance, it is recommended to use the properties available in `SymbolPickerConfiguration`.

### End User Impact

This allows developers to customize the picker to only show relevant categories of items, simplifying the interface for the end user based on the context of their task.
