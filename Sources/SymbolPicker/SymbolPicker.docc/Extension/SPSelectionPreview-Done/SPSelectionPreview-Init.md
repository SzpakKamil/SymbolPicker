# ``SymbolPicker/SPSelectionPreview/init()``

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

Initializes a selection preview.

## Overview

The `init()` initializer builds an `SPSelectionPreview` that responds to the picker's environment.

### Environment Dependencies

The preview resolves its state from several keys:
1. **Selection**: Reads ``SwiftUICore/EnvironmentValues/spSelection`` to find the asset to render.
2. **Layout**: Uses ``SymbolPicker/SPSelectionPreviewConfiguration`` for its size and corner radius.
3. **Visuals**: Adapts to the current `colorScheme` and `dynamicTypeSize`.
4. **Scrolling (iOS 26+)**: Integrates with scroll geometry closures to apply dynamic parallax and scaling.

### Usage

`SPSelectionPreview` is a modular component. Use it in custom layouts where you need high-fidelity asset previews that match the picker's aesthetic.
