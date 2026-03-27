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

Returns a SwiftUI view for the symbol.

## Overview

The `asView()` method integrates a symbol into your SwiftUI hierarchy. It returns a specialized view that handles symbol rendering, variant switching, and platform adjustments.

### Mechanics

When you call this method, it initializes an `SPSymbolView`. This component:
- **Resolves Names**: Maps the current filled or outlined state to the correct SF Symbol string.
- **Scales**: Ensures the icon works with standard SwiftUI font modifiers.
- **Colors**: Respects the environment's foreground color or your explicit color values.

### Variants

Unlike a raw `Image(systemName:)`, `asView()` responds to the symbol's `variant` property. If the state changes, the view updates automatically to show the new style without manual string manipulation.

### Example

```swift
let symbol: SPSymbol = ...
symbol.asView()
    .font(.title)
    .foregroundStyle(.blue)
```
