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

Initialize a static spacing configuration for fixed dimensions.

### Static Constraints

This configuration ignores dynamic type size changes. Use it for UI elements that must stay the same size regardless of user accessibility settings. If you omit any optional parameters, `SymbolPicker` falls back to its internal defaults for that component and the current dynamic type size.

### Usage in Code

```swift
SPSpacing(component: .optionList, width: 24, height: 30, horizontalPadding: 10)
```
