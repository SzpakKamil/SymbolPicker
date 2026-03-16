#  ``SwiftUICore/EnvironmentValues/spSearchText``

Determines the current search query in the picker.

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

> Warning: Use this property to integrate search functionality in custom **Inset Views**. Avoid manual overrides on the standard `SymbolPicker` to prevent state inconsistencies between the input field and the displayed results.

### End User Impact

Enables pre-filling the search query when the picker appears or monitoring the search text in real-time. It's a direct way to programmatically filter the picker's content.
