# ``SymbolPicker/SPPageType/allCases``

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

An array containing all available cases of the page type.

## Overview

The `allCases` static property provides a list of all `SPPageType` cases that are available on the current platform and OS version.

### Dynamic Filtering

This property uses conditional compilation and runtime availability checks to filter out cases that are not supported by the system. For example, the `.image` case is excluded on older OS versions, ensuring that the picker does not offer features that cannot be rendered.
