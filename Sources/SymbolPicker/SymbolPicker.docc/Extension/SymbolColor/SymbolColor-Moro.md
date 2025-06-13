# ``SymbolPicker/SymbolColor/moro``

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

A case of the `SymbolColor` enum representing a moro (olive-like) color.

## Overview

The `moro` case provides a predefined olive-like color for use in the `SymbolPicker` package, ideal for earthy or subdued UI elements. It has a fixed `id` of `13` and is represented by the RGBA values `[0.584, 0.663, 0.592, 1]`, which produce a muted green-grey tone.

### RGBA Values
- **Red**: 0.584
- **Green**: 0.663
- **Blue**: 0.592
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.moro
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```
