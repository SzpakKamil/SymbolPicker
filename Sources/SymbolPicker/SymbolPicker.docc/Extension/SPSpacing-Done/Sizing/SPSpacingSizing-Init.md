# ``SymbolPicker/SPSpacing/Sizing/init(width:height:horizontalPadding:verticalPadding:)``

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

Initializes a new sizing object with optional layout dimensions.

- Parameter width: The fixed width for the component (optional).
- Parameter height: The fixed height for the component (optional).
- Parameter horizontalPadding: The fixed horizontal padding (optional).
- Parameter verticalPadding: The fixed vertical padding (optional).

## Overview

Initialize `Sizing` to specify dimensions in a dynamic spacing configuration. Every parameter is optional, which enables a "diff-based" configuration style.

### Granular Overrides

You only need to provide the dimensions you want to change. If you leave a parameter as `nil`, `SymbolPicker` falls back to its internal default for that component and dynamic type size. This is useful when you want to adjust the height of a component but keep its standard width and padding.

### Usage in Code

```swift
// Overrides height and vertical padding only
let customSizing = SPSpacing.Sizing(
    height: 60,
    verticalPadding: 12
)
```
