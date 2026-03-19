# ``SymbolPicker/SymbolPickerConfiguration/insetViewsConfiguration()-7c9n4``

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


Returns an array of ``SymbolPicker/SPInsetedView`` objects defining the custom layout of the picker.

- Returns: A collection of inseted views.

## Overview

The `insetViewsConfiguration()` method is a powerful layout mechanism that allows placing auxiliary views (like search bars, color pickers, or headers) into specific ``SymbolPicker/SPViewPlacementType`` slots within the picker UI.

### Inset View Placements

- **``SymbolPicker/SPViewPlacementType/safeAreaTop`` / ``SymbolPicker/SPViewPlacementType/safeAreaBottom``**: Sticky views that stay at the top or bottom of the screen, typically used for headers, footers, or persistent controls.
- **``SymbolPicker/SPViewPlacementType/scrollContentTop`` / ``SymbolPicker/SPViewPlacementType/scrollContentBottom``**: Views that scroll with the main list but sit outside the core content container. They are ideal for wrapping the entire picker content.
- **``SymbolPicker/SPViewPlacementType/scrollSectionTop`` / ``SymbolPicker/SPViewPlacementType/scrollSectionBottom``**: Views that scroll and are placed immediately above or below the asset grid itself. They share the same row styling as the assets, making them perfect for headers or footers specific to the asset list.
- **``SymbolPicker/SPViewPlacementType/toolbarTopTralling`` / ``SymbolPicker/SPViewPlacementType/toolbarBottomLeading``**: Views placed directly into the platform's native toolbar. (Note: The enum uses `Tralling` for trailing).

### Customization

```swift
func insetViewsConfiguration() -> [SPInsetedView] {
    // Only show a custom header and the page picker
    SPInsetedView(placement: .safeAreaTop) {
        VStack {
            Text("My Icon Picker")
                .font(.headline)
            Divider()
        }
    }
    
    SPInsetedView(placement: .safeAreaBottom) {
        SPPagePicker()
    }
}
```
