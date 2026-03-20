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

Initializes a new selection preview instance.

## Overview

The `init()` initializer creates an `SPSelectionPreview` that is fully reactive to the `SymbolPicker` environmental state.

### Dependency Context

The initialized preview resolves its rendering state from several environment properties:
1. **Selection Context**: Binds to the shared ``SwiftUICore/EnvironmentValues/spSelection`` environment property to determine which asset to render.
2. **Layout Context**: Utilizes the current ``SymbolPicker/SPSelectionPreviewConfiguration`` to determine its size, corner radius, and transformation rules.
3. **Visual Environment**: Accesses `colorScheme` (dark/light mode) and `dynamicTypeSize` to adapt its aesthetic.
4. **Scroll Geometry (iOS 26+)**: Automatically integrates with ``SymbolPicker/SPSelectionPreviewConfiguration/spSelectionPreviewCalculateScale(_:)`` and ``SymbolPicker/SPSelectionPreviewConfiguration/spSelectionPreviewCalculateOffset(_:)`` to handle dynamic parallax effects when scrolling.

### Usage in Custom Layouts

`SPSelectionPreview` is designed to be highly modular. While primarily used within the standard `SymbolPicker` structure, it can be integrated into custom layouts wherever high-fidelity asset previews are needed.
