# ``SymbolPicker/SymbolPickerDefaultConfiguration/currentInsetViewConfiguration``

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

A closure that returns the set of custom inseted views for the picker.

## Overview

The `currentInsetViewConfiguration` property is a closure that resolves the custom SwiftUI views (``SymbolPicker/SPInsetedView``) that should be placed into predefined "safe area" or "toolbar" slots.

### Parameters

The closure receives the active ``SymbolPicker/SPDisplayStyle`` and the optional ``SymbolPicker/SPColorPickerConfiguration``. This allows you to dynamically inject views based on whether the color picker is active or whether the picker is in compact vs. detail mode.

### Behavior

By default, the closure invokes the static ``SymbolPicker/SymbolPickerDefaultConfiguration/defaultInsetViews(for:colorPicker:)`` method, which provides standard components like the selection preview and close buttons.

### Customization

Provide a custom closure to inject your own views (e.g., a "Confirm" button) into the picker's interface.

```swift
var config = SymbolPickerDefaultConfiguration()
config.currentInsetViewConfiguration = { style, colorPicker in
    var views = SymbolPickerDefaultConfiguration.defaultInsetViews(for: style, colorPicker: colorPicker)
    views.append(SPInsetedView(placement: .bottomBar) {
        Button("Custom Action") { /* ... */ }
    })
    return views
}
```
