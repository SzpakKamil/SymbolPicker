# ``SymbolPicker/SPSymbolView``

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

You use this view to display SF Symbols with automatic variant support.

## Overview

`SPSymbolView` handles the heavy lifting of icon rendering. It resolves symbol names based on your fill preferences and ensures the icon looks correct on every platform.

### Usage

Initialize the view with an instance of ``SymbolPicker/SPSymbol``:

```swift
import SwiftUI
import SymbolPicker

struct MySymbolPreview: View {
    let symbol = SPSymbol(systemName: "heart.fill")

    var body: some View {
        SPSymbolView(symbol: symbol)
            .frame(width: 44, height: 44)
            .foregroundStyle(.red)
    }
}
```

### Variant Awareness

The view reacts to your requested variant state. It mixes your explicit choices with environmental defaults:
- **Explicit Variant**: If you set an ``SymbolPicker/SPSymbol`` to `.filled`, the view strictly follows that choice.
- **Environmental Variant**: If you leave the variant empty, the view reads the ``SymbolPicker/SPSymbol/Variant`` from the environment. This lets a single symbol switch between outline and filled states automatically as you move it through different parts of your UI.

### Adaptive Fallback

If you request a symbol that is too new for the user's operating system, `SPSymbolView` shows a standard "question mark" icon. This fallback keeps your interface stable and functional on older platform versions.

### Accessibility

The view applies accessibility labels from the symbol's annotation or category. This ensures users who rely on assistive technologies can navigate and understand your icons.

### Rendering Performance

`SPSymbolView` offloads rendering to the GPU using the `.drawingGroup()` modifier. This keeps your UI smooth and responsive even when you display thousands of symbols in a large grid.

## Topics

### Initialization

- ``SymbolPicker/SPSymbolView/init(symbol:)``
