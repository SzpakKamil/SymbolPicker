# ``SymbolPicker/SPInsetedViewBuilder``

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

A custom result builder that enables a declarative syntax for defining an array of inseted views.

## Overview

`SPInsetedViewBuilder` is a DSL component that allows developers to define multiple ``SymbolPicker/SPInsetedView`` objects using a clean, SwiftUI-like syntax. It handles the aggregation of inset views that are injected into the symbol picker at various placements.

### Usage

This builder is most commonly used when defining custom `insetViews` within a ``SymbolPicker/SymbolPickerConfiguration``. It supports complex logic, including platform-specific checks (`#if os(...)`) and version checks (`if #available(...)`), enabling highly adaptive picker layouts.

### Example: Complex Adaptive Layout

```swift
@SPInsetedViewBuilder
func customInsetViews() -> [SPInsetedView] {
    // Top-pinned content
    SPInsetedView(placement: .safeAreaTop, spacing: 10) {
        SPSearchBar()
        SPPagePicker()
    }

    // WatchOS Only Action
    #if os(watchOS)
    SPInsetedView(placement: .toolbarBottomLeading) {
        Button("Action") { /* action */ }
    }
    #endif
}
```

## Topics

### Result Builder Methods
The underlying methods used to support the declarative syntax (internal documentation only).
