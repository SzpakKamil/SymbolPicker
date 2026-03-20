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

A generic container view that dynamically resolves and renders a data asset based on the current selection.

## Overview

`SPSelectionView` is a high-level component that acts as a bridge between the abstract ``SymbolPicker/SPSelection`` model and the platform-specific rendering views (``SymbolPicker/SPSymbolView``, ``SymbolPicker/SPEmojiView``, or ``SymbolPicker/SPImageView``).

### Usage

`SPSelectionView` is generic over a type conforming to ``SymbolPicker/SPDataAsset``. To use it, provide an optional ``SymbolPicker/SPSelection``:

```swift
import SwiftUI
import SymbolPicker

struct MySelectionPreview: View {
    // Example with a Symbol selection
    let selection: SPSelection<SPSymbol>? = SPSelection(
        asset: SPSymbol(systemName: "star.fill")
    )

    var body: some View {
        SPSelectionView(selection: selection)
            .frame(width: 60, height: 60)
    }
}
```

### Dynamic Content Resolution

The view uses Swift generics to handle any asset type conforming to the ``SymbolPicker/SPDataAsset`` protocol. Its primary responsibility is to take a selection model and resolve it into its corresponding visual representation:
- **Symbol Selection**: Automatically resolves to an ``SymbolPicker/SPSymbolView``.
- **Emoji Selection**: Automatically resolves to an ``SymbolPicker/SPEmojiView``.
- **Image Selection**: Automatically resolves to an ``SymbolPicker/SPImageView``.

### Reactive State Management

`SPSelectionView` is designed to be fully reactive. When the bound selection changes, the view automatically updates its internal state and triggers a re-render of the appropriate sub-component. It utilizes a unique identifier based on the selection (via ``SymbolPicker/SPSelection/id``) to ensure that SwiftUI correctly identifies and animates transitions between different assets.

### Use Case

This view is primarily used within the `SPOptionList` to render individual cells, but it can also be used in custom layouts where a generic, type-safe asset preview is needed.

### Lifecycle and Rendering

Because `SPSelectionView` frequently acts as a container for other rendering views, it uses a stable unique identifier derived from the ``SymbolPicker/SPSelection/id``. This allows SwiftUI to preserve its state and animations across layout changes while the internal rendering components use `.drawingGroup()` for optimal performance.

## Topics

### Initialization

- ``SymbolPicker/SPSelectionView/init(selection:)``
