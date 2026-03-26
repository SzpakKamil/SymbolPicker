# About SymbolPicker

@Metadata {
    @SupportedLanguage(swift)
    @TitleHeading("Getting Started")
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "16.0")
    @PageColor(blue)
}

@Options {
    @AutomaticSeeAlso(disabled)
}

Customizable SwiftUI asset selection.

## Overview

`SymbolPicker` is an evolution of asset selection for SwiftUI. It provides a unified, modular, and highly customizable interface for picking SF Symbols, Emojis, Colors, and Images. It's designed to be platform-adaptive and extensible, ensuring a native feel while giving developers complete control.

## Why Use SymbolPicker?

SymbolPicker provides a robust alternative to standard pickers:

- **Unified Interface**: Access symbols, emojis, colors, and images from a single component.
- **Deep Customization**: Use the `.plain` style to build your own layout from scratch using `SPInsetedView`.
- **Modular Configuration**: Define precise spacing, OS-specific scale factors, and layout structures.
- **Global Localization**: Localized in 20+ languages out of the box.
- **Accessibility**: First-class support for VoiceOver and Dynamic Type.
- **Smart Search**: Built-in search functionality for quickly finding symbols and emojis.

## Customization Modifiers

Tailor the appearance and behavior using a wide range of SwiftUI modifiers.

- **Display and Layout**:
  - `.spDisplayStyle(_:)`: Choose between standard or `.plain` layouts.
  - `.spSymbolsVariant(_:)`: Set the preferred variant (filled vs. outlined).
  - `.spPageTypes(_:)`: Configure which selection pages (Symbols, Emojis, etc.) are available.
  - `.spSpacing(_:)`: Apply granular spacing configurations.

- **Color Picker**:
  - `.spColorPickerEnabled(_:)`: Toggle color selection.
  - `.spColorPickerColors(_:)`: Provide a custom list of colors.
  - `.spColorPickerLayout(_:spacing:)`: Customize the color picker's grid layout.

- **Option List Appearance**:
  - Customize background and foreground colors for various states (normal, focused, pressed, selected).
  - Adjust corner radius and inner padding factors.

- **Selection Preview**:
  - Configure the preview area's appearance, including corner radius, scale, and offset calculations.

See <doc:Modifiers> for the complete API reference.

## Advanced Configuration Example

Build a highly customized picker by implementing the `SymbolPickerConfiguration` protocol:

```swift
struct CustomPickerConfig: SymbolPickerConfiguration {
    var displayStyle: SPDisplayStyle = .plain 
    
    @SPInsetedViewBuilder
    func insetViewsConfiguration() -> [SPInsetedView] {
        SPInsetedView(placement: .safeAreaTop) {
            SPSearchBar()
            SPPagePicker()
        }
        SPInsetedView(placement: .safeAreaBottom) {
            Text("Custom Footer View")
        }
    }
}

// Usage
.symbolPicker(isPresented: $isPresented, selection: $selection, configuration: CustomPickerConfig())
```

## Target Use Cases

- **Asset Management**: Ideal for apps requiring icon or emoji selection for categories, folders, or profiles.
- **Branded Design Systems**: Perfect for matching app-specific aesthetics with modular components.
- **Cross-Platform Apps**: Ensures a consistent yet platform-native experience across the Apple ecosystem.

## Next Steps

- Integrate SymbolPicker: <doc:SetUp>.
- Explore all modifiers: <doc:Modifiers>.
