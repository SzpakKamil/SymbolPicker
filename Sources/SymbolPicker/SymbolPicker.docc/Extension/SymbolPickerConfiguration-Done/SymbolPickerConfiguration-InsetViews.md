# ``SymbolPicker/SymbolPickerConfiguration/insetViews``

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
}

Accesses the collection of inseted views.

## Overview

The `insetViews` property is a convenience shortcut for calling ``SymbolPicker/SymbolPickerConfiguration/insetViewsConfiguration()``.

### Implementation

It works as a simple wrapper:
```swift
var insetViews: [SPInsetedView] { insetViewsConfiguration() }
```

Use this property to read the list of custom views, such as headers or search bars, that populate the picker's layout slots.
