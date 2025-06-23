# ``SymbolPicker/SymbolPicker/symbolPickerDismiss(type:action:)``

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

A modifier that configures the dismissal behavior of the `SymbolPicker` view and an optional action to execute upon dismissal.

## Overview

The `symbolPickerDismiss(type:action:)` modifier allows developers to customize how the `SymbolPicker` view is dismissed within a SwiftUI application. By specifying a `SymbolPickerDismissType` value (e.g., `.dismissOnSymbolChange` or `.manual`), developers can control whether the picker dismisses automatically when a symbol is selected or requires manual dismissal. Additionally, an optional closure can be provided to perform custom actions when the picker is dismissed, such as logging the event or updating the application state. This modifier is part of the `SymbolPicker` package, a SwiftUI-based reimplementation of Apple’s SF Symbol picker, ensuring a seamless and native-like experience across iOS, iPadOS, macOS, and visionOS. The modifier supports accessibility features like VoiceOver and Dynamic Type, enhancing usability.

## Parameters
- **type**: A `SymbolPickerDismissType` value that determines the dismissal behavior of the picker. Defaults to `.manual`. Options include:
  - `.dismissOnSymbolChange`: Automatically dismisses the picker when a symbol is selected.
  - `.manual`: Requires explicit user action to dismiss the picker.
- **action**: An optional closure that executes when the picker is dismissed. Defaults to `nil`.

## Return Value
A modified view with the specified dismissal behavior and optional action applied to the `SymbolPicker`.

## Example

The following example demonstrates how to apply the `symbolPickerDismiss(type:action:)` modifier to configure the `SymbolPicker` to dismiss automatically when a symbol is selected and execute a custom action:

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
        .symbolPickerDismiss(type: .dismissOnSymbolChange, action: {
            print("Symbol picker dismissed with selected symbol: \(symbolName)")
        })
    }
}
```
