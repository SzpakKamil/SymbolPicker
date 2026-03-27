# ``SymbolPicker/SPSpacing/init(component:configuration:)``

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

Initializes a dynamic spacing configuration that responds to system accessibility changes.

- Parameter component: The target ``SymbolPicker/SPSpacing/Component``.
- Parameter configuration: A closure that provides the current `DynamicTypeSize` and returns a ``SymbolPicker/SPSpacing/Sizing`` object.

## Overview

Initialize a dynamic spacing configuration to respond to system accessibility changes.

### Adaptive Layouts

The closure provides the current `DynamicTypeSize`, allowing you to return a ``SymbolPicker/SPSpacing/Sizing`` object with scaled dimensions. This ensures your layout stays usable when users change their font size. Use this for adaptive components like the color picker, where cell size should increase alongside text to maintain accessibility.

### Usage in Code

```swift
SPSpacing(component: .colorPicker) { typeSize in
    let base: CGFloat = typeSize.isAccessibilitySize ? 60 : 45
    return .init(width: base, height: base)
}
```
