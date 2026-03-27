# ``SymbolPicker/SPInsetedView/Placement/init(rawValue:)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

Creates a placement from an integer.

- Parameter rawValue: The integer for a placement case.
- Returns: A `Placement` if the value is valid. Otherwise, returns `nil`.

## Overview

The `init(rawValue:)` initializer builds a `Placement` from its integer value. Use this for saving configurations or loading settings from external data.
