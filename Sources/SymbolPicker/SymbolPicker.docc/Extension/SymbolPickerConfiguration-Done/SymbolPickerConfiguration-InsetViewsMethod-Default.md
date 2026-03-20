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


Returns an array of ``SymbolPicker/SPInsetedView`` objects defining the custom layout of the picker.

- Returns: A collection of inseted views.

## Overview

The `insetViewsConfiguration()` method is a powerful layout mechanism that allows placing auxiliary views (like search bars, color pickers, or headers) into specific ``SymbolPicker/SPInsetedView/Placement`` slots within the picker UI.

### Inset View Placements

- **``SymbolPicker/SPInsetedView/Placement/safeAreaTop`` / ``SymbolPicker/SPInsetedView/Placement/safeAreaBottom``**: Sticky views that stay at the top or bottom of the screen, typically used for headers, footers, or persistent controls.
- **``SymbolPicker/SPInsetedView/Placement/scrollContentTop`` / ``SymbolPicker/SPInsetedView/Placement/scrollContentBottom``**: Views that scroll with the main list but sit outside the core content container. They are ideal for wrapping the entire picker content.
- **``SymbolPicker/SPInsetedView/Placement/scrollSectionTop`` / ``SymbolPicker/SPInsetedView/Placement/scrollSectionBottom``**: Views that scroll and are placed immediately above or below the asset grid itself. They share the same row styling as the assets, making them perfect for headers or footers specific to the asset list.
- **``SymbolPicker/SPInsetedView/Placement/toolbarTopTralling`` / ``SymbolPicker/SPInsetedView/Placement/toolbarTopLeading``**: Views placed directly into the platform's native toolbar. (Note: The enum uses `Tralling` for trailing).
- **``SymbolPicker/SPInsetedView/Placement/toolbarBottomLeading``**: Views integrated into the leading side of the platform's native bottom toolbar. This position is typically used for secondary actions or dismissal options.
- **``SymbolPicker/SPInsetedView/Placement/toolbarBottom``**: Views placed in the center of the native bottom toolbar. This high-visibility location is often reserved for primary actions or important status indicators.
- **``SymbolPicker/SPInsetedView/Placement/toolbarBottomTralling``**: Views placed on the trailing side of the native bottom toolbar. (Note: The enum uses `Tralling` for trailing). This is generally the preferred location for confirmation or primary actions.

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
