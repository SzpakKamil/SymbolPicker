# ``SymbolPicker/SymbolPicker``

A platform-agnostic SwiftUI `View` for selecting SF Symbols, Emojis, and custom images.

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

`SymbolPicker` provides a unified interface to browse and select high-quality icons. You use its configuration-driven design to maintain a consistent look across platforms while retaining deep control over individual components.

## Overview

The picker uses a modular architecture that supports various asset types and visual styles through a flexible configuration system.

### Architectural Design

Two generic type parameters define the picker's behavior and data model:

- **`DataAsset`**: Conforms to ``SymbolPicker/SPDataAsset``. This determines which assets you see, such as ``SymbolPicker/SPSymbol`` or ``SymbolPicker/SPEmoji``.
- **`Configuration`**: Conforms to ``SymbolPicker/SymbolPickerConfiguration``. This dictates the visual style, layout, and component behavior.

The picker manages its internal state—including selection, category, and search query—and syncs seamlessly with your SwiftUI environment.

### Key Features

- **Generic Assets**: You can browse SF Symbols, Emojis, and custom images in one interface.
- **Adaptive Layout**: The UI automatically adjusts for different platforms, screen sizes, and dynamic type settings.
- **Search Integration**: The picker integrates with SwiftUI's `.searchable` system and offers enhanced styling on modern OS versions.
- **Deep Customization**: You can refine every visual detail, from the color palette to the selection preview card, using modifiers.
- **Environment Support**: Internal state flows through the SwiftUI environment, letting custom child components react to your changes.

### Internal State

The picker coordinates several pieces of state:

- **Selection**: A binding to the active asset, often wrapped in an ``SymbolPicker/SPSelection`` object.
- **Page Type**: Tracks whether you are viewing Symbols, Emojis, or Images.
- **Search Text**: Stores your current search query to filter assets.
- **Style**: The configuration instance governing the overall appearance.

## Usage

### Basic Setup

Bind the picker to a symbol name and a color for a quick implementation.

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

Apply modifiers to change the display style, variants, and color picker features.

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
