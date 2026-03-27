# ``SymbolPicker/SymbolPickerConfiguration/insetViewsConfiguration()-1g88i``

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

The `insetViewsConfiguration()` method lets you place custom SwiftUI views into specific ``SymbolPicker/SPInsetedView/Placement`` slots in the picker UI. Use this to add search bars, color pickers, or headers.

### Placements

- **`.safeAreaTop` / `.safeAreaBottom`**: Sticky views for persistent controls.
- **`.scrollContentTop` / `.scrollContentBottom`**: Views that scroll with the main list.
- **`.scrollSectionTop` / `.scrollSectionBottom`**: Views placed immediately above or below the asset grid.
- **Toolbar slots**: Views integrated into native platform toolbars.

### Customization

```swift
func insetViewsConfiguration() -> [SPInsetedView] {
    SPInsetedView(placement: .safeAreaTop) {
        Text("My Icon Picker").font(.headline)
    }
    
    SPInsetedView(placement: .safeAreaBottom) {
        SPPagePicker()
    }
}
```
