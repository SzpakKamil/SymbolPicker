# ``SymbolPicker/SymbolPickerConfiguration/selectionPreviewConfiguration()-3z2zs``

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

Returns an ``SymbolPicker/SPSelectionPreviewConfiguration`` for the selection preview.

- Returns: A configuration object for the preview component.

## Default Implementation

```swift
func selectionPreviewConfiguration() -> SPSelectionPreviewConfiguration { return .init() }
```

The `selectionPreviewConfiguration()` method sets the look and animation for the ``SymbolPicker/SPSelectionPreview``. This view shows the user's current choice.

### Features

- **Corner Radius**: Set the rounding for the preview item.
- **Scroll Animations**: On iOS 18+, use `calculateOffset` and `calculateScale` closures to animate the preview based on scroll movement.

### Customization

```swift
func selectionPreviewConfiguration() -> SPSelectionPreviewConfiguration {
    SPSelectionPreviewConfiguration()
        .spSelectionPreviewCornerRadiusFactor(0.2)
        .spSelectionPreviewCalculateScale { geometry in
             return 1.2
        }
}
```
