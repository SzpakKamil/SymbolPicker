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

A closure for resolving custom inset views.

## Overview

The `currentInsetViewConfiguration` property resolves the custom SwiftUI views (``SymbolPicker/SPInsetedView``) for predefined slots like toolbars or safe areas.

### Parameters

The closure receives the active display style and the optional color picker settings. Use these to inject views dynamically based on the picker's state.

### Customization

```swift
var config = SymbolPickerDefaultConfiguration()
config.currentInsetViewConfiguration = { style, colorPicker in
    var views = SymbolPickerDefaultConfiguration.defaultInsetViews(for: style, colorPicker: colorPicker)
    views.append(SPInsetedView(placement: .safeAreaBottom) {
        Button("Custom Action") { /* ... */ }
    })
    return views
}
```
