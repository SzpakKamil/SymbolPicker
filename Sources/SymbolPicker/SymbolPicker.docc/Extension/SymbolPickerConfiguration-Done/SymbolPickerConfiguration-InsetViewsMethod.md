# ``SymbolPicker/SymbolPickerConfiguration/insetViewsConfiguration()``

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

Returns an array of ``SymbolPicker/SPInsetedView`` objects for the picker layout.

- Returns: A collection of inseted views.

## Overview

The `insetViewsConfiguration()` method lets you place custom SwiftUI views into specific ``SymbolPicker/SPInsetedView/Placement`` slots in the picker UI.

### Placements

- **`.safeAreaTop` / `.safeAreaBottom`**: Sticky views for headers or persistent controls.
- **`.scrollContentTop` / `.scrollContentBottom`**: Views that scroll with the main list but wrap the core content.
- **`.scrollSectionTop` / `.scrollSectionBottom`**: Views that scroll and sit immediately above or below the asset grid.
- **`.toolbarTopTralling` / `.toolbarTopLeading`**: Views for the native top toolbar.
- **`.toolbarBottomLeading` / `.toolbarBottom` / `.toolbarBottomTralling`**: Views for the native bottom toolbar.

### Customization

```swift
func insetViewsConfiguration() -> [SPInsetedView] {
    SPInsetedView(placement: .safeAreaTop) {
        VStack {
            Text("Icon Picker").font(.headline)
            Divider()
        }
    }
    
    SPInsetedView(placement: .safeAreaBottom) {
        SPPagePicker()
    }
}
```
