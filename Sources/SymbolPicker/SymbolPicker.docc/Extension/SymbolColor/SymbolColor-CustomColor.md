# ``SymbolPicker/SymbolColor/customColor(red:green:blue:alpha:)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

A case of the `SymbolColor` enum representing a user-defined color with custom RGBA values.

## Overview

The `customColor(red:_:green:_:blue:_:alpha:)` case allows developers to define a custom color for use in the `SymbolPicker` package by providing individual `Double` values for red, green, blue, and alpha components, each in the range `[0, 1]`. This case is ideal for scenarios where predefined colors (e.g., `.red`, `.blue`) do not meet the application’s design requirements. The `id` for a custom color is computed by combining the RGBA components (with a small offset to avoid zero), ensuring uniqueness unless the values are identical. If any component is invalid (e.g., outside `[0, 1]`), a default `id` of `15` is used.

### RGBA Values
- **Red**: The red component, specified as a `Double` in `[0, 1]`.
- **Green**: The green component, specified as a `Double` in `[0, 1]`.
- **Blue**: The blue component, specified as a `Double` in `[0, 1]`.
- **Alpha**: The alpha component, specified as a `Double` in `[0, 1]`.

### Example Usage

```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let customColor = SymbolColor.customColor(red: 0.5, green: 0.2, blue: 0.8, alpha: 1.0) // Purple-like custom color
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(customColor.color)
    }
}
```
