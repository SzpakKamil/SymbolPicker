# ``SymbolPicker/SPSelectionPreview``

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

A high-fidelity component that displays the selected symbol, emoji, or image.

## Overview

`SPSelectionPreview` gives users immediate visual feedback. It resolves the active selection and applies styles based on current variants and colors.

### Rendering Logic

The preview uses sophisticated layout and color rules:
- **Contrast**: When you pick a tint, the preview calculates luminance and switches the icon color to black or white for readability.
- **Source Awareness**: The component handles differences between vector symbols, emojis, and photos automatically.
- **Depth**: It applies gradients, shadows, and rounding for a modern, tactile feel.

### Platform Adaptation

The view changes its behavior for each system:
- **iOS and visionOS**: On iOS 26+, it uses scroll geometry for dynamic scaling and parallax.
- **watchOS**: Renders as a circle optimized for small screens.
- **tvOS**: Becomes focusable and provides feedback when highlighted via remote.

### Integration

Add the preview to your `SymbolPicker` body. It finds the selection in the environment.

```swift
SPSelectionPreview()
```

### Inset Helper

The `asInsetView()` method returns a pre-configured ``SymbolPicker/SPInsetedView``:
- **iOS/macOS/visionOS/tvOS 26+**: Uses the ``SymbolPicker/SPInsetedView/Placement/safeAreaTop`` placement.
- **Older Systems**: Uses the ``SymbolPicker/SPInsetedView/Placement/scrollContentTop`` placement.
- **watchOS**: Uses the ``SymbolPicker/SPInsetedView/Placement/toolbarBottomTralling`` placement.

## Topics

### Initialization
- ``SymbolPicker/SPSelectionPreview/init()``

### Supporting Types
- ``SymbolPicker/SPSelectionPreviewConfiguration``
