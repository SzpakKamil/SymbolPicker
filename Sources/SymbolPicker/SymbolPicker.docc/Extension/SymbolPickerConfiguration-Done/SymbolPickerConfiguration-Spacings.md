# ``SymbolPicker/SymbolPickerConfiguration/spacings``

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
}

Accesses the collection of spacing rules.

## Overview

The `spacings` property is a convenience shortcut for calling ``SymbolPicker/SymbolPickerConfiguration/spacingConfiguration()``.

### Implementation

It works as a simple wrapper:
```swift
var spacings: [SPSpacing] { spacingConfiguration() }
```

The library uses this property internally to get dynamic dimensions for layout components without repetitive function calls.
