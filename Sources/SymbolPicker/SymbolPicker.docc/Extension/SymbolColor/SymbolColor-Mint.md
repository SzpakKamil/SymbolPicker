# ``SymbolPicker/SymbolColor/mint``

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

A case of the `SymbolColor` enum representing a mint color.

## Overview

The `mint` case provides a predefined mint color for use in the `SymbolPicker` package, suitable for fresh and vibrant UI designs. It has a fixed `id` of `4` and is represented by the RGBA values `[0.451, 0.780, 0.435, 1]`, which create a light green-blue hue.

### RGBA Values
- **Red**: 0.451
- **Green**: 0.780
- **Blue**: 0.435
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.mint
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```
