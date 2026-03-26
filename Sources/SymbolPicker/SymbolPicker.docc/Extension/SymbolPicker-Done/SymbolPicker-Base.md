# ``SymbolPicker/SymbolPicker``

A platform-agnostic, generic SwiftUI `View` designed for selecting visual assets (SF Symbols, Emojis, and custom Images).

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

`SymbolPicker` provides a unified interface for browsing and selecting high-quality icons and emojis. It leverages a configuration-driven approach to maintain consistency across platforms while allowing for deep customization.

## Overview

The picker is designed to be highly modular and extensible, supporting a wide range of asset types and visual styles through a flexible configuration system.

### Architectural Design

`SymbolPicker` is built around two primary generic type parameters that define its core behavior and data model:

- **`DataAsset`**: Must conform to ``SymbolPicker/SPDataAsset``. This parameter determines the type of assets the picker displays (e.g., ``SymbolPicker/SPSymbol``, ``SymbolPicker/SPEmoji``, or ``SymbolPicker/SPImage``).
- **`Configuration`**: Must conform to ``SymbolPicker/SymbolPickerConfiguration``. This dictates the visual style, layout strategy, and behavior of the picker's internal components.

The picker maintains its own internal state, including the current selection, active page (category), and search query, while seamlessly integrating with the SwiftUI environment for state propagation.

### Key Features

- **Generic Asset Support**: Browse and select from SF Symbols, Emojis, or custom bitmapped images within a single, unified interface.
- **Adaptive UI**: The layout automatically adjusts based on the current platform, screen size, and dynamic type settings, ensuring an optimal user experience everywhere.
- **Modern Search Integration**: Deep integration with SwiftUI's `.searchable` system, featuring enhanced styling and placement on modern OS versions (e.g., iOS 26+).
- **Deep Customization**: Every visual aspect, from the color selection palette and asset grid to the selection preview card, can be customized via modifiers.
- **Environment Driven**: Internal state is propagated through the SwiftUI environment, allowing custom child components to react to selection changes and search queries.

### Core Internal State

The picker manages several key pieces of state to coordinate its modular components:

- **Selection**: A binding to the currently selected asset, often wrapped in an ``SymbolPicker/SPSelection`` object.
- **Page Type**: Tracks the currently active category (e.g., Symbols, Emojis, or Images).
- **Search Text**: Stores the user's current search query to filter the displayed assets.
- **Style**: The active configuration instance that governs the overall appearance.

## Usage

### Basic Usage

The simplest way to use `SymbolPicker` is by binding it to a `String` for an SF Symbol name and a `Color`.

```swift
struct MyIconPicker: View {
    @State private var symbolName = "star.fill"
    @State private var iconColor = Color.blue
    @State private var isPresented = false

    var body: some View {
        Button("Select Icon") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            systemImage: $symbolName,
            color: $iconColor
        )
    }
}
```

### Advanced Customization

You can use modifiers to deeply customize the picker's appearance and behavior.

```swift
SymbolPicker(systemImage: $symbolName, color: $iconColor)
    .spDisplayStyle(.compact)
    .spSymbolsVariant(.hierarchical)
    .spColorPickerEnabled(true)
    .spColorPickerSupportsOpacity(true)
    .spOptionListCornerRadiusFactor(1.5)
```

## Topics

### General Selection Initializers
- ``SymbolPicker/SymbolPicker/init(selection:configuration:)-(Binding<SPSelection<DataAsset>>,_)``
- ``SymbolPicker/SymbolPicker/init(selection:configuration:)-(Binding<SPSelection<DataAsset>?>,_)``

### System Image Initializers
- ``SymbolPicker/SymbolPicker/init(systemImage:configuration:)-(Binding<String>,_)``
- ``SymbolPicker/SymbolPicker/init(systemImage:configuration:)-(Binding<String?>,_)``
- ``SymbolPicker/SymbolPicker/init(systemImage:ckColor:configuration:)-(Binding<String>,_,_)``
- ``SymbolPicker/SymbolPicker/init(systemImage:ckColor:configuration:)-(Binding<String?>,_,_)``
- ``SymbolPicker/SymbolPicker/init(systemImage:color:configuration:)-(Binding<String>,_,_)``
- ``SymbolPicker/SymbolPicker/init(systemImage:color:configuration:)-(Binding<String?>,_,_)``
- ``SymbolPicker/SymbolPicker/init(systemImage:colorValues:configuration:)-(Binding<String>,_,_)``
- ``SymbolPicker/SymbolPicker/init(systemImage:colorValues:configuration:)-(Binding<String?>,_,_)``

### Emoji Initializers
- ``SymbolPicker/SymbolPicker/init(emoji:configuration:)-(Binding<SPEmoji>,_)``
- ``SymbolPicker/SymbolPicker/init(emoji:configuration:)-(Binding<SPEmoji?>,_)``
- ``SymbolPicker/SymbolPicker/init(emoji:ckColor:configuration:)-(Binding<SPEmoji>,_,_)``
- ``SymbolPicker/SymbolPicker/init(emoji:ckColor:configuration:)-(Binding<SPEmoji?>,_,_)``
- ``SymbolPicker/SymbolPicker/init(emoji:color:configuration:)-(Binding<SPEmoji>,_,_)``
- ``SymbolPicker/SymbolPicker/init(emoji:color:configuration:)-(Binding<SPEmoji?>,_,_)``
- ``SymbolPicker/SymbolPicker/init(emoji:colorValues:configuration:)-(Binding<SPEmoji>,_,_)``
- ``SymbolPicker/SymbolPicker/init(emoji:colorValues:configuration:)-(Binding<SPEmoji?>,_,_)``

### Image Initializers
- ``SymbolPicker/SymbolPicker/init(image:configuration:)-(Binding<SPImage>,_)``
- ``SymbolPicker/SymbolPicker/init(image:configuration:)-(Binding<SPImage?>,_)``
- ``SymbolPicker/SymbolPicker/init(image:ckColor:configuration:)-(Binding<SPImage>,_,_)``
- ``SymbolPicker/SymbolPicker/init(image:ckColor:configuration:)-(Binding<SPImage?>,_,_)``
- ``SymbolPicker/SymbolPicker/init(image:color:configuration:)-(Binding<SPImage>,_,_)``
- ``SymbolPicker/SymbolPicker/init(image:color:configuration:)-(Binding<SPImage?>,_,_)``
- ``SymbolPicker/SymbolPicker/init(image:colorValues:configuration:)-(Binding<SPImage>,_,_)``
- ``SymbolPicker/SymbolPicker/init(image:colorValues:configuration:)-(Binding<SPImage?>,_,_)``

### Display and Behavior Modifiers
- ``SymbolPicker/SymbolPicker/spDisplayStyle(_:)``
- ``SymbolPicker/SymbolPicker/spSymbolsVariant(_:)``
- ``SymbolPicker/SymbolPicker/spAllowSearching(_:)``
- ``SymbolPicker/SymbolPicker/spPageTypes(_:defaultType:)-(SPPageType...,_)``
- ``SymbolPicker/SymbolPicker/spPageTypes(_:defaultType:)-([SPPageType],_)``
- ``SymbolPicker/SymbolPicker/spInsetedViews(replaceDefaults:views:)``
- ``SymbolPicker/SymbolPicker/spSpacing(_:)``

### Color Picker Modifiers
- ``SymbolPicker/SymbolPicker/spColorPickerEnabled(_:)``
- ``SymbolPicker/SymbolPicker/spColorPickerColors(_:)-([CKColor])``
- ``SymbolPicker/SymbolPicker/spColorPickerColors(_:)-(CKColor...)``
- ``SymbolPicker/SymbolPicker/spColorPickerLayout(_:spacing:)``
- ``SymbolPicker/SymbolPicker/spColorPickerSupportsOpacity(_:)``
- ``SymbolPicker/SymbolPicker/spColorPickerSupportsCustomColor(_:)``

### Option List Appearance Modifiers
- ``SymbolPicker/SymbolPicker/spOptionListCornerRadiusFactor(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListInnerPaddingFactor(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListForeground(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListForegroundFocused(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListForegroundPressed(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListForegroundSelected(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListBackground(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListBackgroundFocused(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListBackgroundSelected(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListBackgroundPressed(_:)``

### Selection Preview Modifiers
- ``SymbolPicker/SymbolPicker/spSelectionPreviewCornerRadiusFactor(_:)``
- ``SymbolPicker/SymbolPicker/spSelectionPreviewCalculateOffset(_:)``
- ``SymbolPicker/SymbolPicker/spSelectionPreviewCalculateScale(_:)``
