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

The `Sizing` initializer is the primary way to specify dimensions within a dynamic spacing configuration. By using optional parameters for all attributes, it allows for a "diff-based" configuration style.

### Granular Overrides

You do not need to provide all dimensions when creating a `Sizing` object. Any parameter left as `nil` will instruct the `SymbolPicker` to fall back to its internal default value for that specific attribute, component, and current dynamic type size.

This is particularly useful when you only want to adjust, for example, the height of a component while keeping its standard width and padding.

### Usage in Code

```swift
// Only overriding height and vertical padding
let customSizing = SPSpacing.Sizing(
    height: 60,
    verticalPadding: 12
)
```
