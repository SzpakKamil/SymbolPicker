# ``SymbolPicker``

A comprehensive SwiftUI icon and emoji picker with deep platform integration.

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
}

## Overview

`SymbolPicker` is a highly customizable, platform-adaptive library for selecting SF Symbols, Emojis, and custom Images. It provides a familiar, native-feeling interface while offering developers extensive control over layout, styling, and behavior.

### High-Level Architecture

The library is built on a modular architecture:
- **Core View**: The ``SymbolPicker/SymbolPicker`` struct is the main entry point.
- **Data Layer**: Protocol-oriented design using ``SymbolPicker/SPDataAsset`` for flexibility in what can be selected.
- **Styling**: A configuration-driven system powered by ``SymbolPicker/SymbolPickerConfiguration``.
- **Extensibility**: A unique ``SymbolPicker/SPInsetedView`` system for injecting custom UI components.

## Topics

### Core View
The main component for integrating the picker into your app.

- ``SymbolPicker/SymbolPicker``

### Asset Models
The data types that the picker displays and returns.

- ``SymbolPicker/SPDataAsset``
- ``SymbolPicker/SPSymbol``
- ``SymbolPicker/SPEmoji``
- ``SymbolPicker/SPImage``
- ``SymbolPicker/SPCategory``

### Customization
How to tailor the picker's appearance and functionality.

- ``SymbolPicker/SymbolPickerConfiguration``
- ``SymbolPicker/SPInsetedView``
- ``SymbolPicker/SPSpacing``

### Sub-Components
The modular building blocks that make up the picker's UI.

- ``SymbolPicker/SPOptionList``
- ``SymbolPicker/SPColorPicker``
- ``SymbolPicker/SPSelectionPreview``
- ``SymbolPicker/SPPagePicker``
- ``SymbolPicker/SPSearchBar``
- ``SymbolPicker/SPDismissButton``

### Specialized Configurations
Fine-grained settings for specific components.

- ``SymbolPicker/SPPresentationConfiguration``
- ``SymbolPicker/SPOptionListConfiguration``
- ``SymbolPicker/SPColorPickerConfiguration``
- ``SymbolPicker/SPSelectionPreviewConfiguration``
- ``SymbolPicker/SPOptionListCornerRadiusFactor``
- ``SymbolPicker/SPOptionListInnerPaddingFactor``

### Environment
How the picker communicates with its children and host view.

- ``SwiftUICore/EnvironmentValues/spSelection``
- ``SwiftUICore/EnvironmentValues/spPageType``
- ``SwiftUICore/EnvironmentValues/spSearchText``
- ``SwiftUICore/EnvironmentValues/spSymbolVariant``
- ``SwiftUICore/EnvironmentValues/symbolPickerStyle``

### Extensions
Convenience modifiers for presenting the picker.

- ``SwiftUICore/View/symbolPicker(isPresented:selection:configuration:)``
