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

A unique identifier for the page type, ensuring it conforms to the `Identifiable` protocol.

## Overview

The `id` property is used by SwiftUI to uniquely identify pages when they are presented in a tab view or page picker. This ensures that the UI can correctly track and animate transitions between different content pages.

### Data Format

The `id` property returns the raw string value of the `SPPageType` enum (e.g., `"Symbol"`, `"Emoji"`, or `"Image"`).
