# `SymbolPicker`
![Swift Version](https://img.shields.io/badge/Swift-6.0+-teal.svg)
![Platforms](https://img.shields.io/badge/Platforms-iOS%2015.0+%20|%20iPadOS%2015.0+%20|%20macOS%2012.0+%20|%20watchOS%2010.0+%20|%20tvOS%2015.0+%20|%20visionOS%201.0+-15437D.svg)
![License](https://img.shields.io/badge/License-MIT-C8ECFE.svg)

![Banner](./Resources/SymbolPicker-Banner.png#gh-light-mode-only)
![Banner](./Resources/SymbolPicker-BannerDark.png#gh-dark-mode-only)

# Symbols, Evolved.
### I redefined the picker experience. SymbolPicker gives you total control over asset selection in SwiftUI.

Forget system limitations. I built **SymbolPicker** to offer a unified, modular, and highly customizable interface for selecting Symbols, Emojis, Colors, and Images across all Apple platforms.

> **A complete rewrite.**
> Version 2.0 is a ground-up reimagining of what a picker should be. Modular components, modern concurrency, and a design that feels native on every device.

Visit the [Site](https://kamilszpak.com/symbolpicker) or [Documentation](https://documentation.kamilszpak.com/documentation/symbolpicker).

---

## Table of Contents

- [Production-Ready Features](#production-ready-features)
- [Your Layout, Your Rules](#your-layout-your-rules)
- [Instant Integration](#instant-integration)
- [Modular Architecture](#modular-architecture)
- [Resources](#resources)
- [Installation](#installation)
- [Requirements](#requirements)
- [License](#license)

## Production-Ready Features
I handled the complexity so you don't have to. Integrate a robust asset selector that scales with your app.

- **Unified Selection**: One picker to rule them all. Select SF Symbols, Emojis, Colors, and Custom Images in a single, cohesive interface.
- **Cross-Platform Mastery**: Native experiences on iOS, macOS, iPadOS, watchOS, tvOS, and visionOS.
- **Global Reach**: Fully localized in over 20 languages (English, Spanish, French, German, Chinese, Japanese, and many more).
- **Accessibility First**: Built with VoiceOver and Dynamic Type at its core, ensuring your app is usable by everyone.
- **Smart Search**: Powered by `SearchBar`, finding the right symbol or emoji is instant and intuitive.

## Your Layout, Your Rules
Don't fight the framework. Customize every aspect of the picker to match your design language.

- **Custom Placements**: Inject your own views with `SPInsetedView`. Add headers, footers, or custom controls exactly where you need them.
- **Pure Canvas**: Use the `.plain` display style to strip away default layouts. Rearrange core components like `SPSearchBar` or `SPPagePicker` freely using inset views.
- **Adaptive Design**: The interface optimizes automatically for different screen sizes, from the wrist to the desktop.

## Instant Integration
Drop it in and go. The default configuration provides a polished experience out of the box.

### Basic Usage
Present the picker as a sheet or popover:

```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var selection: SPSelection<SPSymbol>? = nil
    @State private var isPresented = false

    var body: some View {
        Button("Select Symbol") {
            isPresented = true
        }
        .symbolPicker(isPresented: $isPresented, selection: $selection)
        .onChange(of: selection) { newValue in
            if let symbol = newValue {
                print("Selected: \(symbol.id)")
            }
        }
    }
}
```

## Modular Architecture
This is where SymbolPicker 2.0 shines. Break it apart and build your own custom selector using the exposed components.

```swift
struct MyConfiguration: SPSymbolPickerConfiguration {
    // 1. Start with a blank canvas
    var displayStyle: SPDisplayStyle = .plain 
    
    // 2. Define precise component sizing and padding
    var spacing: SPSpacing {
        SPSpacing(
            colorPicker: .init(spacings: [.medium: 45], osScaleFactors: [.iOS: 1.0], horizontalPadding: [:], verticalPadding: [:]),
            optionList: .init(spacings: [.medium: 20], osScaleFactors: [.iOS: 1.0], horizontalPadding: [:], verticalPadding: [:]),
            selectedSymbol: .init(spacings: [.medium: 50], osScaleFactors: [.iOS: 1.0], horizontalPadding: [:], verticalPadding: [:])
        )
    }

    // 3. Rebuild the layout by injecting views into specific slots
    @SPInsetedViewBuilder
    func insetViewsConfiguration() -> [SPInsetedView] {
        SPInsetedView(placement: .safeAreaTop) {
            SPSearchBar()
            SPPagePicker()
        }
    }
}
```

## Resources
- **Documentation**: Detailed [API Reference](https://documentation.kamilszpak.com/documentation/symbolpicker).
- **GitHub Repo**: Track issues and help shape the roadmap.
- **Swift Package Index**: Check [Compatibility](https://swiftpackageindex.com/SzpakKamil/SymbolPicker) across all platforms.

## Installation

### Swift Package Manager
Add `SymbolPicker` via SPM. The minimum version required is **2.0.0**.

```swift
dependencies: [
    .package(url: "https://github.com/SzpakKamil/SymbolPicker.git", from: "2.0.0")
]
```

## Requirements
- **Platforms**: iOS 15.0+, macOS 12.0+, tvOS 15.0+, watchOS 10.0+, visionOS 1.0+
- **Tools**: Swift 6.0+, Xcode 16.0+

## License
`SymbolPicker` is released under the MIT license.
