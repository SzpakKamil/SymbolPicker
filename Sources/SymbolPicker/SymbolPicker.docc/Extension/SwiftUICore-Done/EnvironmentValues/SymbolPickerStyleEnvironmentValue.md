#  ``SwiftUICore/EnvironmentValues/symbolPickerStyle``

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

The configuration style for SymbolPicker.

## Overview

The `symbolPickerStyle` property holds the ``SymbolPickerConfiguration`` for the picker. Read this value in custom **``SymbolPicker/SPInsetedView``** layouts to match the picker's current display mode and layout settings.

> Warning: Pass your configuration as a parameter to the picker view or modifier instead of overwriting this key manually.

### Details

This property centralizes customization. It lets you change how the picker behaves and looks across your entire app by setting a single configuration in the environment.
