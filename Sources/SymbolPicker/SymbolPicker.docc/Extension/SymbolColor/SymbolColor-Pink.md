# ``SymbolPicker/SymbolColor/pink``

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

A case of the `SymbolColor` enum representing a pink color.

## Overview

The `pink` case provides a predefined pink color for use in the `SymbolPicker` package, suitable for playful and vibrant UI elements. It has a fixed `id` of `11` and is represented by the RGBA values `[0.906, 0.557, 0.816, 1]`, which create a soft pink tone.

### RGBA Values
- **Red**: 0.906
- **Green**: 0.557
- **Blue**: 0.816
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.pink
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```
