# ``SymbolPicker/SPSelectionView``

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

A generic view that resolves and renders a data asset.

## Overview

`SPSelectionView` bridges the abstract ``SymbolPicker/SPSelection`` model and specific rendering views like ``SymbolPicker/SPSymbolView`` or ``SymbolPicker/SPEmojiView``.

### Usage

The view is generic over any type following the ``SymbolPicker/SPDataAsset`` protocol. Provide an optional ``SymbolPicker/SPSelection`` to initialize it:

```swift
import SwiftUI
import SymbolPicker

struct MySelectionPreview: View {
    let selection: SPSelection<SPSymbol>? = SPSelection(
        asset: SPSymbol(systemName: "star.fill")
    )

    var body: some View {
        SPSelectionView(selection: selection)
            .frame(width: 60, height: 60)
    }
}
```

### Content Resolution

The view resolves selection models into visual forms:
- **Symbol**: Renders an ``SymbolPicker/SPSymbolView``.
- **Emoji**: Renders an ``SymbolPicker/SPEmojiView``.
- **Image**: Renders an ``SymbolPicker/SPImageView``.

### Reactivity

`SPSelectionView` responds to binding changes. When the selection updates, the view triggers a re-render of the matching sub-component. It uses the ``SymbolPicker/SPSelection/id`` to track identity and animate transitions correctly in SwiftUI.

### Implementation

The view populates cells in the `SPOptionList`. You can also use it in custom layouts where you need a type-safe asset preview. For better performance during scrolling, the internal components use the `.drawingGroup()` modifier.

## Topics

### Initialization
- ``SymbolPicker/SPSelectionView/init(selection:)``
