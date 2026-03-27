# ``SymbolPicker/SPPageType/id``

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

A unique identifier for the page type.

## Overview

SwiftUI uses the `id` property to track pages in tab views or pickers. It allows the system to animate transitions between different content pages.

### Format

The property returns the raw string value of the enum case, such as `"Symbol"`, `"Emoji"`, or `"Image"`.
