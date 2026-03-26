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

## Overview

`SymbolPicker` provides a unified interface for browsing and selecting high-quality icons and emojis. It leverages a configuration-driven approach to maintain consistency across platforms while allowing for deep customization.

### Key Features

- **Generic Asset Support**: Browse and select from SF Symbols, Emojis, or custom bitmapped images.
- **Adaptive UI**: Automatically adjusts its layout based on the current platform, screen size, and dynamic type settings.
- **Modern Search Integration**: Seamlessly integrates with SwiftUI's `.searchable` system, with enhanced styling on modern OS versions.
- **Customizable Components**: Every part of the picker, including the color selection palette, asset grid, and selection preview, can be extensively customized.
- **Environment Driven**: Propagates its state through the SwiftUI environment, allowing child components to react to selection changes and search queries.

### Architectural Design

The picker is designed around two generic type parameters:
- `DataAsset`: Conforming to ``SymbolPicker/SPDataAsset``, defining the type of items being picked.
- `Configuration`: Conforming to ``SymbolPicker/SymbolPickerConfiguration``, dictating the visual style and behavior.

The picker maintains its own internal state for selection, page navigation, and search queries, and it provides a wide range of initializers to simplify binding to common data types like `String` (for SF Symbol names) and `Color`.

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
