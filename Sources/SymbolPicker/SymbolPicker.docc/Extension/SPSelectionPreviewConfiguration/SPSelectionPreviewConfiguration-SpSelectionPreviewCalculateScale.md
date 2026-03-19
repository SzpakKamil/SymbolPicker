# ``SymbolPicker/SPSelectionPreviewConfiguration/spSelectionPreviewCalculateScale(_:)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "26.0")
    @Available(macOS, introduced: "26.0")
    @Available(tvOS, introduced: "26.0")
    @Available(watchOS, introduced: "26.0")
    @Available(visionOS, introduced: "26.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "26.0")
    @DocumentationExtension(mergeBehavior: override)
}

Sets the closure for calculating the dynamic scale of the selection preview and returns the modified configuration.

- Parameter closure: A `@Sendable` closure that takes `ScrollGeometry` and returns a `CGFloat` scale.
- Returns: The updated configuration instance.

## Overview

`spSelectionPreviewCalculateScale(_:)` is a chainable method used to update the ``SymbolPicker/SPSelectionPreviewConfiguration/calculateScale`` property.

### Usage in Code

```swift
let config = SPSelectionPreviewConfiguration()
    .spSelectionPreviewCalculateScale { geometry in
        // Custom scale logic
        return 1.0
    }
```
