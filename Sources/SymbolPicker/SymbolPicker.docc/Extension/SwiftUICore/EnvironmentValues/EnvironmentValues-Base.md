#  ``SwiftUICore/EnvironmentValues/``

Public environment properties to control and observe the SymbolPicker state.

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

Environment properties to control and observe the `SymbolPicker` state.

> Warning: These properties are primarily intended for reading state or styling within custom **Inset Views**. Manually overwriting these keys on the standard `SymbolPicker` view is strictly discouraged as it breaks internal cross-view synchronization and communication.

## Topics

### Configuration
- ``SwiftUICore/EnvironmentValues/symbolPickerStyle``
- ``SwiftUICore/EnvironmentValues/spSymbolVariant``

### State & Navigation
- ``SwiftUICore/EnvironmentValues/spPageType``
- ``SwiftUICore/EnvironmentValues/spSearchText``
- ``SwiftUICore/EnvironmentValues/spSelection``
