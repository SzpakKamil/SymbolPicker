# ``SymbolPicker/SymbolPickerConfiguration/insetViews``

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


A convenience computed property that returns the collection of inseted views.

## Overview

The `insetViews` property provides a shortened syntax for accessing the results of ``SymbolPicker/SymbolPickerConfiguration/insetViewsConfiguration()``.

### Implementation

It is defined as a simple wrapper:
```swift
var insetViews: [SPInsetedView] { insetViewsConfiguration() }
```
