# ``SymbolPicker/SPSymbol/asView()``

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

Generates a SwiftUI view representation of the symbol.

## Overview

The `asView()` method is the primary way to integrate a symbol into a SwiftUI hierarchy. It returns an type-erased or specialized view that handles the complexities of symbol rendering, including variant switching and platform-specific adjustments.

### Internal Mechanism

When called, this method initializes an `SPSymbolView`. This internal component is responsible for:
- **System Image Resolution**: Mapping the current state (filled or outlined) to the correct SF Symbol name string.
- **Dynamic Sizing**: Ensuring the symbol scales correctly with standard SwiftUI font modifiers.
- **Color Integration**: Respecting the foreground color environment or explicitly passed color values.

### Variant Awareness

One of the key advantages of using `asView()` over a raw `Image(systemName:)` is its awareness of the symbol's internal `variant` property. If the symbol's state changes, the view will automatically update to reflect the new visual style without requiring manual string manipulation by the developer.

### Usage Example

```swift
let symbol: SPSymbol = ...
symbol.asView()
    .font(.title)
    .foregroundStyle(.blue)
```
