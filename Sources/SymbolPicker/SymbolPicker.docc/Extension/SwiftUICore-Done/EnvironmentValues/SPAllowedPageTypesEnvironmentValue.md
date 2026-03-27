# ``SwiftUICore/EnvironmentValues/spAllowedPageTypes``

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

An array of ``SPPageType`` that sets available pages like symbols or emojis.

## Overview

An ``SPPageType`` defines content like images, emojis, or symbols in SymbolPicker.

Use this property to control which data categories users can access. For example, setting this value to `[.symbol]` limits the picker to only show symbols.

This property works with SymbolPicker initializers or view modifiers that do not require an ``SPSelection`` type. It enforces a specific look without overriding ``SymbolPickerConfiguration``.

> Important: This property is read-only within the picker's hierarchy. Use ``SymbolPickerConfiguration`` to change behavior and appearance.

### Impact

You can restrict the picker to relevant categories. This simplifies the interface for users based on their current task.
