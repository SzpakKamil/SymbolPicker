#  ``SwiftUICore/EnvironmentValues/spSearchText``

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

The current search query in the picker.

## Overview

The `spSearchText` property stores the string users type into the search bar. Use it in custom **``SymbolPicker/SPInsetedView``** components to filter content or react to user input.

> Warning: Do not manually overwrite this property on the standard ``SymbolPicker/SymbolPicker``. Doing so creates a mismatch between the text field and the displayed results.

### Usage

This property lets you pre-fill the search field when the picker opens. You can also monitor the query in real-time to update other parts of your interface based on the user's search.
