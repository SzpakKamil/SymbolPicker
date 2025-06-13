# ``SymbolPicker/SymbolColor/customColor(_:)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "14.0")
    @DocumentationExtension(mergeBehavior: override)
}

A case of the `SymbolColor` enum representing a user-defined color with custom RGBA values.

## Overview

The `customColor(_:)` case allows developers to define a custom color for use in the `SymbolPicker` package by providing an array of four `Double` values representing red, green, blue, and alpha components (each in the range `[0, 1]`). This case is ideal for scenarios where the predefined colors (e.g., `red`, `blue`) do not meet the application’s design requirements. The `id` for a custom color is computed by multiplying the RGBA components (with a small offset to avoid zero), ensuring uniqueness unless the arrays are identical. If the provided array does not contain exactly four components, a default `id` of `15` is used.

### RGBA Values
- **Red**: Defined by `value[0]`.
- **Green**: Defined by `value[1]`.
- **Blue**: Defined by `value[2]`.
- **Alpha**: Defined by `value[3]`.

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let customColor = SymbolColor.customColor([0.5, 0.2, 0.8, 1.0]) // Purple-like custom color
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(customColor.color)
    }
}
```
