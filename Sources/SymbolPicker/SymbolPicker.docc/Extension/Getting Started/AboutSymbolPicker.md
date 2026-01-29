# About SymbolPicker

@Metadata {
    @SupportedLanguage(swift)
    @TitleHeading("Getting Started")
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @PageColor(green)
    @PageImage(purpose: card, source: "SymbolPickerGreeting")
}

@Options{
    @AutomaticSeeAlso(disabled)
}

Learn about the customizable SwiftUI `SymbolPicker` package for a native-like SF Symbol selection experience.

## Overview

Apple’s SF Symbol picker is not available to developers, so the `SymbolPicker` package rebuilds it from the ground up in SwiftUI, providing a flexible and accessible solution for iOS, iPadOS, visionOS, and macOS. Using native SwiftUI components, it delivers a native-like interface for selecting from thousands of SF Symbols. Available as a standalone `SymbolPicker` view or a `.symbolPicker` modifier that dynamically adjusts presentation (popover on macOS, iPadOS, and visionOS, sheet on iOS), it enables seamless integration into any SwiftUI app. The package includes unit tests to ensure reliability and stability across platforms.

### Symbol Availability Across OS Versions

The `SymbolPicker` package ensures that users only see SF Symbols compatible with their device’s operating system by filtering symbols based on their defined SF Symbols version. Each symbol is associated with a specific SF Symbols version (e.g., SF Symbols 7 for iOS 26). At runtime, the package compares the system’s SF Symbols version with the version required by each symbol, displaying only those symbols supported on the current OS. This filtering prevents empty grid cells in the picker interface, which could occur if symbols introduced in newer SF Symbols versions are shown on older systems, ensuring a polished user experience across a wide range of OS versions.

### Accessibility Enhancements

The `SymbolPicker` package prioritizes inclusivity by providing descriptive accessibility labels for each SF Symbol, enhancing the VoiceOver experience. Instead of reading raw symbol names like `car.fill` or `arrow.left.and.top.and.right.and.bottom`, VoiceOver announces user-friendly descriptions, such as "Symbol of a car" or "Symbol of arrow pointing to all directions." These custom labels are attached to each symbol, ensuring that users relying on VoiceOver can easily understand and navigate the picker’s content, making the interface more accessible and intuitive.

## Why Use SymbolPicker?

The `SymbolPicker` package offers a powerful alternative to a missing Apple API with:

- **Custom Rebuild**: Reimplements the SF Symbol picker in SwiftUI, as Apple’s picker is unavailable to developers.
- **Dual Presentation**: Use as a standalone `SymbolPicker` view or a `.symbolPicker` modifier for adaptive presentation (popover or sheet).
- **Reliable Testing**: Unit tests ensure stability and performance across iOS and macOS.
- **Detailed Documentation**: Swift DocC with tutorials and API references for easy adoption.
- **Custom Styling**: Modifiers for symbol style and dismissal behavior to match app design.
- **Accessibility**: Supports VoiceOver with descriptive symbol labels and Dynamic Type for inclusive experiences.
- **Lightweight Design**: Minimal dependencies, integrated via Swift Package Manager.
- **Platform Consistency**: Unified SwiftUI API with native-like behaviors for iOS and macOS.
- **OS-Aware Symbol Filtering**: Filters SF Symbols by comparing their defined version with the system’s SF Symbols version, avoiding empty grid cells.

These features make `SymbolPicker` ideal for apps requiring intuitive and customizable icon selection.

## Customization Modifiers

The `SymbolPicker` package provides two modifiers to tailor appearance and behavior using SwiftUI’s dot syntax:

- `.symbolPickerSymbolsStyle(_:)`: Configures the symbol display style (e.g., `.filled`, `.outline`).
- `.symbolPickerDismiss(type:action:)`: Sets the dismissal behavior (e.g., dismiss on symbol change or manual view dismiss).

For a complete list, see <doc:Modifiers>.

Example:

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
        .symbolPickerSymbolsStyle(.filled)
        .symbolPickerDismiss(type: .dismissOnSymbolChange)
    }
}
```

## Target Use Cases

The `SymbolPicker` package is ideal for:
- **Icon Customization**: Apps allowing users to select icons for profiles, categories, or annotations.
- **Design Tools**: Applications requiring icon selection for UI design or prototyping.
- **Cross-Platform Apps**: Consistent symbol picker experience across iOS and macOS.
- **Accessible Interfaces**: Apps prioritizing VoiceOver and Dynamic Type support for inclusivity.

## Next Steps

- Learn to integrate the package in <doc:SetUp>.
- Explore modifier details in <doc:Modifiers>.
- Build a sample app with <doc:SymbolGallery>.
