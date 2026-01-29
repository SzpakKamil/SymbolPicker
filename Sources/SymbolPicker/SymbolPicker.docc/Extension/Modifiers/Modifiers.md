# Modifiers

@Metadata {
    @SupportedLanguage(swift)
    @TitleHeading("Structure")
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @PageColor(green)
    @PageImage(purpose: card, source: "SymbolPickerModifiers")
}

@Options{
    @AutomaticSeeAlso(disabled)
}

Learn about the modifiers available for customizing the `SymbolPicker` package in SwiftUI.

## Overview

The `SymbolPicker` package provides modifiers to customize its appearance and behavior within SwiftUI applications. These modifiers are applied using SwiftUI’s dot syntax (e.g., `.symbolPickerSymbolsStyle(_:)`), supporting accessibility features like VoiceOver and Dynamic Type. Designed as a SwiftUI rebuild of Apple’s unavailable SF Symbol picker, the package offers a native-like experience for iOS, iPadOS, visionOS, and macOS. Below, the two available modifiers are detailed, with platform availability noted.

## Modifiers

### Appearance and Behavior Modifiers
- ``SymbolPicker/SymbolPicker/symbolPickerSymbolsStyle(_:)``: Configures the display style of symbols (e.g., `.filled`, `.outline`).
- ``SymbolPicker/SymbolPicker/symbolPickerDismiss(type:action:)``: Sets the dismissal behavior (e.g., dismiss on symbol change or manual view dismiss) and an optional action to execute upon dismissal.

## Example

Here’s an example demonstrating both modifiers in a SwiftUI view:

```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var isPresented = false
    @State private var symbolName = "star.fill"

    var body: some View {
        Button(action: { isPresented = true }) {
            Image(systemName: symbolName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }
        .symbolPicker(isPresented: $isPresented, symbolName: $symbolName)
        .symbolPickerSymbolsStyle(.outline)
        .symbolPickerDismiss(type: .dismissOnSymbolChange, action: { print("Symbol picker dismissed") })
    }
}
```

## Next Steps

- Explore the `SymbolPicker` setup guide in <doc:SetUp>.
- Build a sample app with <doc:SymbolGallery>.
