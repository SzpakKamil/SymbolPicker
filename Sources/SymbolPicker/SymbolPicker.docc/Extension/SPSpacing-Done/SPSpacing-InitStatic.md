# ``SymbolPicker/SPSpacing/init(component:width:height:horizontalPadding:verticalPadding:)``

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

Initializes a static spacing configuration with fixed dimensions.

- Parameter component: The target ``SymbolPicker/SPSpacing/Component``.
- Parameter width: The fixed width for the component (optional).
- Parameter height: The fixed height for the component (optional).
- Parameter horizontalPadding: The fixed horizontal padding (optional).
- Parameter verticalPadding: The fixed vertical padding (optional).

## Overview

This initializer creates a spacing configuration with static values that do not respond to dynamic type size changes. Use it for UI elements that must maintain a consistent size regardless of user accessibility settings.

### Default Values

If any of the optional parameters are not provided, the `SymbolPicker` will automatically fall back to its internal default configuration values for that specific component and current dynamic type size.

### Usage in Code

```swift
SPSpacing(component: .optionList, width: 24, height: 30, horizontalPadding: 10)
```
