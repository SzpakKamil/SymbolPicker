# ``SymbolPicker/SymbolColor/magenta``

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

A case of the `SymbolColor` enum representing a magenta color.

## Overview

The `magenta` case provides a predefined magenta color for use in the `SymbolPicker` package, ideal for bold and vibrant UI elements. It has a fixed `id` of `10` and is represented by the RGBA values `[0.698, 0.490, 0.871, 1]`, which produce a bright purple-pink tone.

### RGBA Values
- **Red**: 0.698
- **Green**: 0.490
- **Blue**: 0.871
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.magenta
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```
