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

Define an array of inseted views using a declarative syntax.

## Overview

`SPInsetedViewBuilder` provides a DSL for defining multiple ``SymbolPicker/SPInsetedView`` objects. It aggregates views for injection into the symbol picker at specific placements.

### Usage

You use this builder when defining custom `insetViews` in a ``SymbolPicker/SymbolPickerConfiguration``. It supports platform checks with `#if os(...)` and version checks with `if #available(...)` to adapt layouts to the environment.

### Example: Adaptive Layout

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
Underlying methods for the declarative syntax.
