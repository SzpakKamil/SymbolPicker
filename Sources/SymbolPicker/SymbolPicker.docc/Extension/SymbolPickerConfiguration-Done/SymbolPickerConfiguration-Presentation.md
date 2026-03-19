# ``SymbolPicker/SymbolPickerConfiguration/presentation``

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


A convenience computed property that returns the presentation configuration.

## Overview

The `presentation` property provides a shortened syntax for accessing the results of ``SymbolPicker/SymbolPickerConfiguration/presentationConfiguration()``.

### Implementation

It is defined as a simple wrapper:
```swift
var presentation: SPPresentationConfiguration { presentationConfiguration() }
```
