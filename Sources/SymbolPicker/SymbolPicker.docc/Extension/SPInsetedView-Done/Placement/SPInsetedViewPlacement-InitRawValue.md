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

Initializes a placement from a raw integer value.

- Parameter rawValue: The integer value corresponding to a placement case.
- Returns: A `Placement` instance if the raw value is valid, or `nil` otherwise.

## Overview

The `init(rawValue:)` initializer allows for the creation of a `Placement` from its underlying integer representation. This is primarily used for persistence or when loading configuration from external data sources.
