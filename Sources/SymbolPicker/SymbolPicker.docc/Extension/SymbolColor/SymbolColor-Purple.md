# ``SymbolPicker/SymbolColor/purple``

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

A case of the `SymbolColor` enum representing a purple color.

## Overview

The `purple` case provides a predefined purple color for use in the `SymbolPicker` package, ideal for vibrant and expressive UI elements. It has a fixed `id` of `9` and is represented by the RGBA values `[0.490, 0.329, 0.729, 1]`, which produce a rich purple hue.

### RGBA Values
- **Red**: 0.490
- **Green**: 0.329
- **Blue**: 0.729
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.purple
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```
