# ``SymbolPicker/SymbolColor/blue``

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

A case of the `SymbolColor` enum representing a blue color.

## Overview

The `blue` case provides a predefined blue color for use in the `SymbolPicker` package, suitable for symbols or UI elements requiring a vibrant blue hue. It has a fixed `id` of `7` and is represented by the RGBA values `[0.259, 0.514, 0.969, 1]`, which translate to a rich blue in the RGB color space.

### RGBA Values
- **Red**: 0.259
- **Green**: 0.514
- **Blue**: 0.969
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.blue
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```

