# `SymbolPicker`
![Swift Version](https://img.shields.io/badge/Swift-6.0+-teal.svg)
![Platforms](https://img.shields.io/badge/Platforms-iOS%2015.0+%20|%20iPadOS%2015.0+%20|%20macOS%2012.0+%20|%20watchOS%2010.0+%20|%20tvOS%2015.0+%20|%20visionOS%201.0+-15437D.svg)
![License](https://img.shields.io/badge/License-MIT-C8ECFE.svg)

![Banner](./Resources/SymbolPicker-Banner.png#gh-light-mode-only)
![Banner](./Resources/SymbolPicker-BannerDark.png#gh-dark-mode-only)

# Symbols, Evolved.

Total control over asset selection in SwiftUI. `SymbolPicker` offers a unified, modular interface for selecting Symbols, Emojis, Colors, and Images across all Apple platforms.

Visit the [Site](https://kamilszpak.com/symbolpicker) or [Documentation](https://documentation.kamilszpak.com/documentation/symbolpicker).

---

## Table of Contents

- [Features](#features)
- [Your Layout, Your Rules](#your-layout-your-rules)
- [Instant Integration](#instant-integration)
- [Modular Architecture](#modular-architecture)
- [Resources](#resources)
- [Installation](#installation)
- [Requirements](#requirements)
- [License](#license)

## Features
Integrate a robust asset selector that scales with your app.

- **Unified Selection**: Select SF Symbols, Emojis, Colors, and Custom Images in one interface.
- **Cross-Platform**: Native support for iOS, macOS, iPadOS, watchOS, tvOS, and visionOS.
- **Global Reach**: Localized in 20+ languages.
- **Accessibility First**: Supports VoiceOver and Dynamic Type.
- **Smart Search**: Search symbols and emojis instantly.

## Your Layout, Your Rules
Customize the picker to match your design.

- **Custom Placements**: Inject custom views (headers, footers) with `SPInsetedView`.
- **Pure Canvas**: Use `.plain` style to strip default layouts. Rearrange components with inset views.
- **Adaptive Design**: Interface adapts to all screen sizes.

## Instant Integration
Default configuration provides a polished experience.

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
Build custom selectors using exposed components.

```swift
struct MyConfiguration: SymbolPickerConfiguration {
    // 1. Start with a blank canvas
    var displayStyle: SPDisplayStyle = .plain 
    
    // 2. Define precise component sizing and padding
    var spacing: SPSpacingConfiguration {
        SPSpacingConfiguration(
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
Add `SymbolPicker` via SPM. Minimum version: **2.0.0**.

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
