# ``SymbolPicker/SymbolPicker/symbolPickerSymbolsStyle(_:)``

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

A modifier that configures the display style of symbols in the `SymbolPicker` view.

## Overview

The `symbolPickerSymbolsStyle(_:)` modifier allows developers to customize the visual appearance of symbols within the `SymbolPicker` view by specifying a `SymbolStyle` value, such as `.filled` or `.outline`. This modifier enhances the flexibility of the `SymbolPicker` package, enabling developers to align the symbol presentation with their application’s design language. Applied using SwiftUI’s dot syntax, the modifier ensures that all symbols displayed in the picker conform to the chosen style, while maintaining support for accessibility features like VoiceOver and Dynamic Type. The modifier is part of the `SymbolPicker` package, a SwiftUI-based reimplementation of Apple’s SF Symbol picker, providing a native-like experience across iOS, iPadOS, macOS, and visionOS.

## Parameters
- **style**: A `SymbolStyle` value that determines the display style of symbols in the picker (e.g., `.filled` for filled symbols or `.outline` for outlined symbols).

## Return Value
A modified view with the specified symbol display style applied to the `SymbolPicker`.

## Example

The following example demonstrates how to apply the `symbolPickerSymbolsStyle(_:)` modifier to configure the `SymbolPicker` to display symbols in an outline style:

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
    }
}
```

## Design Images

@TabNavigator {
    @Tab("iOS") {
        @Row(numberOfColumns: 2) {
            @Column {
                @Image(source: "Documentation-SymbolStyle-Filled-iOS", alt: "Filled") { Filled }
            }
            @Column {
                @Image(source: "Documentation-SymbolStyle-Outlined-iOS", alt: "Outlined") { Outlined }
            }
        }
    }
    @Tab("iPadOS") {
        @Row(numberOfColumns: 2) {
            @Column {
                @Image(source: "Documentation-SymbolStyle-Filled-iPadOS", alt: "Filled") { Filled }
            }
            @Column {
                @Image(source: "Documentation-SymbolStyle-Outlined-iPadOS", alt: "Outlined") { Outlined }
            }
        }
    }
    @Tab("macOS") {
        @Row(numberOfColumns: 2) {
            @Column {
                @Image(source: "Documentation-SymbolStyle-Filled-macOSTahoe", alt: "Filled") { Filled }
            }
            @Column {
                @Image(source: "Documentation-SymbolStyle-Outlined-macOSTahoe", alt: "Outlined") { Outlined }
            }
        }
    }
    @Tab("visionOS") {
        @Row(numberOfColumns: 2) {
            @Column {
                @Image(source: "Documentation-SymbolStyle-Filled-visionOS", alt: "Filled") { Filled }
            }
            @Column {
                @Image(source: "Documentation-SymbolStyle-Outlined-visionOS", alt: "Outlined") { Outlined }
            }
        }
    }
}
