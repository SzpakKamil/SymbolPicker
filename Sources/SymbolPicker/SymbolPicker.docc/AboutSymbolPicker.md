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

Pick SwiftUI assets through a single tool.

## Overview

SymbolPicker selects SF Symbols, Emojis, Colors, and Images in SwiftUI. It works on every Apple platform and gives you control over the native experience.

## Why Use SymbolPicker?

SymbolPicker replaces standard pickers with a more flexible tool.

- **One Tool**: Select symbols, emojis, colors, and images in one place.
- **Plain Style**: Use `.plain` style to build custom layouts with `SPInsetedView`.
- **Flexible Settings**: Set spacing and scale factors for each operating system.
- **Localization**: Use any of 20+ supported languages.
- **Accessibility**: Support VoiceOver and Dynamic Type.
- **Search**: Find assets quickly with the built-in search bar.

## Customization Modifiers

Change appearance and behavior with SwiftUI modifiers.

- **Display and Layout**:
  - `.spDisplayStyle(_:)`: Switch between standard and `.plain` layouts.
  - `.spSymbolsVariant(_:)`: Pick filled or outlined icons.
  - `.spPageTypes(_:)`: Choose pages like Symbols or Emojis.
  - `.spSpacing(_:)`: Set exact spacing values.

- **Color Picker**:
  - `.spColorPickerEnabled(_:)`: Turn the color picker on or off.
  - `.spColorPickerColors(_:)`: Provide your own color list.
  - `.spColorPickerLayout(_:spacing:)`: Define the grid layout.

- **Option List Appearance**:
  - Set background and foreground colors for focused, pressed, or selected states.
  - Control corner radius and padding.

- **Selection Preview**:
  - Adjust the preview's corner radius, scale, and offset.

See <doc:Modifiers> for the full API reference.

## Advanced Configuration

Create a custom picker by implementing the `SymbolPickerConfiguration` protocol.

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
            Text("Custom Footer")
        }
    }
}

// Usage
.symbolPicker(isPresented: $isPresented, selection: $selection, configuration: CustomPickerConfig())
```

## Use Cases

- **Asset Management**: Choose icons for categories or user profiles.
- **Branded Design**: Match your app's look with custom components.
- **Multi-Platform Apps**: Keep the experience consistent on iOS, macOS, and visionOS.

## Next Steps

- Start using the library: <doc:SetUp>.
- Check the modifiers: <doc:Modifiers>.
