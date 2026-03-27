# ``SwiftUICore/EnvironmentValues/spAllowsColorSelection``

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

Toggles the color picker for symbols and emojis.

## Overview

When `true`, users can pick a color for their selected asset. Setting this to `false` hides the color selection interface.

Initializers or view modifiers that do not use ``SPSelection`` use this property to enforce a specific look. It controls the picker's appearance without changing your ``SymbolPickerConfiguration``.

> Important: This property is read-only. To customize the picker's behavior, use ``SymbolPickerConfiguration``.

### Details

This property ensures selected assets match your app's design rules. You can lock colors or allow customization based on the user's current task.
