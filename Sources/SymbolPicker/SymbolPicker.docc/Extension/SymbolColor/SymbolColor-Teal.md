# ``SymbolPicker/SymbolColor/teal``

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

A case of the `SymbolColor` enum representing a teal color.

## Overview

The `teal` case provides a predefined teal color for use in the `SymbolPicker` package, ideal for modern and calming UI designs. It has a fixed `id` of `5` and is represented by the RGBA values `[0.216, 0.792, 0.678, 1]`, which produce a vibrant teal hue.

### RGBA Values
- **Red**: 0.216
- **Green**: 0.792
- **Blue**: 0.678
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.teal
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```
