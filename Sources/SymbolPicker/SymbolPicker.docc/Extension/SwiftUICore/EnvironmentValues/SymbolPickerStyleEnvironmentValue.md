#  ``SwiftUICore/EnvironmentValues/symbolPickerStyle``

The global configuration style for the SymbolPicker.

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

> Warning: Read this in custom **Inset Views** to respect the picker's layout and display mode. Never overwrite this manually; pass your configuration as a parameter to the `SymbolPicker` view or `.symbolPicker` modifier instead.

### End User Impact

The most powerful way to customize the picker's behavior and look. By reading or overriding this in the environment, you can dynamically adjust how the picker renders without modifying its internal source code.
