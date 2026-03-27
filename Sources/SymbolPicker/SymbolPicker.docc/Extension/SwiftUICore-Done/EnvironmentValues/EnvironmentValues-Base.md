#  ``SwiftUICore/EnvironmentValues/``

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

Public environment properties for SymbolPicker.

## Overview

Use these environment keys to read or observe the state of ``SymbolPicker/SymbolPicker``.

> Warning: These properties help you style and manage custom **Inset Views**. Do not manually overwrite these keys on the standard picker view. Overwriting them breaks internal communication and view synchronization.

## Topics

### Configuration
- ``SwiftUICore/EnvironmentValues/symbolPickerStyle``
- ``SwiftUICore/EnvironmentValues/spSymbolVariant``
- ``SwiftUICore/EnvironmentValues/spAllowedPageTypes``
- ``SwiftUICore/EnvironmentValues/spAllowsColorSelection``

### State & Navigation
- ``SwiftUICore/EnvironmentValues/spPageType``
- ``SwiftUICore/EnvironmentValues/spSearchText``
- ``SwiftUICore/EnvironmentValues/spSelection``
