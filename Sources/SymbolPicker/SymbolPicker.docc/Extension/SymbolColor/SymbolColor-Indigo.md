# ``SymbolPicker/SymbolColor/indigo``

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

A case of the `SymbolColor` enum representing an indigo color.

## Overview

The `indigo` case provides a predefined indigo color for use in the `SymbolPicker` package, suitable for deep and sophisticated UI elements. It has a fixed `id` of `8` and is represented by the RGBA values `[0.302, 0.392, 0.737, 1]`, which create a dark blue-purple hue.

### RGBA Values
- **Red**: 0.302
- **Green**: 0.392
- **Blue**: 0.737
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.indigo
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```

