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

A convenience computed property that returns the collection of spacing rules for the picker.

## Overview

The `spacings` property provides a shortened syntax for accessing the results of ``SymbolPicker/SymbolPickerConfiguration/spacingConfiguration()``. It is primarily used internally to reduce repetitive function calls and maintain cleaner code when layout components need to retrieve dynamic dimensions.

### Implementation

It is defined as a simple wrapper:
```swift
var spacings: [SPSpacing] { spacingConfiguration() }
```
