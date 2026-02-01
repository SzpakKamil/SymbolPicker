# ``SymbolPicker/SymbolPickerSymbolsStyle``

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

An enumeration that defines the visual style for symbols in the `SymbolPicker` package.

## Overview

The `SymbolPickerSymbolsStyle` enum specifies the rendering style for symbols in a `SymbolPicker` view, supporting two cases: `filled` and `outlined`. It conforms to `Identifiable`, `Equatable`, `Codable`, and `Hashable`, making it suitable for use in SwiftUI views, data persistence, and collections. The style is applied using the `.symbolPickerSymbolsStyle(_:)` modifier on a `SymbolPicker` view. The `filled` style renders symbols with a solid fill, while the `outlined` style renders symbols with a stroked outline. The table below summarizes the available styles, their IDs, and descriptions.

### Style Grid
| Style Name | ID | Description |
|------------|----|-------------|
| Filled     | 0  | Renders the symbol with a solid fill, suitable for bold and prominent visuals. |
| Outlined   | 1  | Renders the symbol with a stroked outline, ideal for a lighter, minimalistic appearance. |

## Example

The following example demonstrates how to apply the ``SymbolPicker/SymbolPickerSymbolsStyle`` to configure the `SymbolPicker`:

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


## Topics

### Cases
- ``SymbolPicker/SymbolPickerSymbolsStyle/filled``
- ``SymbolPicker/SymbolPickerSymbolsStyle/outlined``

### Properties
- ``SymbolPicker/SymbolPickerSymbolsStyle/id``
