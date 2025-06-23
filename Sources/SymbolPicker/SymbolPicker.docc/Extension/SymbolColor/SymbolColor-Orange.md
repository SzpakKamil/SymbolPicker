# ``SymbolPicker/SymbolColor/orange``

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

A case of the `SymbolColor` enum representing an orange color.

## Overview

The `orange` case provides a predefined orange color for use in the `SymbolPicker` package, suitable for warm and energetic UI elements. It has a fixed `id` of `1` and is represented by the RGBA values `[0.945, 0.537, 0.427, 1]`, which create a bright orange tone.

### RGBA Values
- **Red**: 0.945
- **Green**: 0.537
- **Blue**: 0.427
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.orange
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```
