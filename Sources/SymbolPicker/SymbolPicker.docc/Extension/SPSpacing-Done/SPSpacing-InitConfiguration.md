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

Use this initializer for creating highly adaptive layouts. The provided closure is called whenever the system's dynamic type size changes, allowing you to return scaled dimensions for the specified component.

### Usage in Code

```swift
SPSpacing(component: .colorPicker) { typeSize in
    let base: CGFloat = typeSize.isAccessibilitySize ? 60 : 45
    return .init(width: base, height: base)
}
```
