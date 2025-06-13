# ``SymbolPicker/SymbolColor/green``

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

A case of the `SymbolColor` enum representing a green color.

## Overview

The `green` case provides a predefined green color for use in the `SymbolPicker` package, suitable for vibrant or nature-inspired UI elements. It has a fixed `id` of `3` and is represented by the RGBA values `[0.945, 0.749, 0.298, 1]`, which create a bright green hue.

### RGBA Values
- **Red**: 0.945
- **Green**: 0.749
- **Blue**: 0.298
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.green
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```
