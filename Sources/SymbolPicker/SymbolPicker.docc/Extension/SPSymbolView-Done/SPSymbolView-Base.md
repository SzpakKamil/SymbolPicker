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

A dedicated view for rendering SF Symbols with support for variant-based selection.

## Overview

`SPSymbolView` is a specialized rendering component designed specifically for SF Symbols within the ``SymbolPicker`` ecosystem. It handles the complexities of resolving symbol names based on the desired fill variant and ensuring that the icon is displayed correctly across all supported platforms.

### Usage

To use `SPSymbolView`, initialize it with an instance of ``SymbolPicker/SPSymbol``:

```swift
import SwiftUI
import SymbolPicker

struct MySymbolPreview: View {
    // Using the system name initializer
    let symbol = SPSymbol(systemName: "heart.fill")

    var body: some View {
        SPSymbolView(symbol: symbol)
            .frame(width: 44, height: 44)
            .foregroundStyle(.red)
    }
}
```

### Variant Awareness

The view is highly reactive to the symbol's requested variant state. It uses a combination of explicit configuration and environmental defaults:
- **Explicit Variant**: If an ``SymbolPicker/SPSymbol`` is initialized with a specific variant (e.g., `.filled` or `.none`), the view will strictly adhere to that choice.
- **Environmental Variant**: If no explicit variant is set, the view resolves its state from the ``SymbolPicker/SPSymbol/Variant`` provided through the environment. This allows a single symbol to automatically switch between filled and outline states depending on where it is used in the UI.

### Adaptive Fallback

In cases where a requested symbol is not available on the current operating system version, `SPSymbolView` automatically falls back to a standardized "question mark" icon. This ensures that the user interface remains stable and functional even when using newer SF Symbols on older platform versions.

### Accessibility

The view automatically applies appropriate accessibility labels derived from the symbol's annotation or its category (via ``SymbolPicker/SPPageType/symbol``), ensuring that the visual icons are fully navigable and understandable for users relying on assistive technologies.

### Rendering Performance

`SPSymbolView` utilizes the `.drawingGroup()` modifier to offload rendering to the GPU. This ensures that even when many symbols are displayed simultaneously—such as in a large grid or list—the UI remains smooth and responsive by reducing the overhead on the main thread.

## Topics

### Initialization

- ``SymbolPicker/SPSymbolView/init(symbol:)``
