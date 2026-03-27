# ``SymbolPicker/SymbolPickerConfiguration/presentationConfiguration()-8l8re``

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

Returns an ``SymbolPicker/SPPresentationConfiguration`` for the picker modal.

- Returns: A configuration object for modal presentation.

## Default Implementation

```swift
func presentationConfiguration() -> SPPresentationConfiguration { return .init(style: displayStyle) }
```

The `presentationConfiguration()` method defines the picker's modal "shell." It sets the presentation type, such as sheet or popover, and controls background colors, corner radii, and drag behaviors.

### Customization

Use the fluent API in ``SymbolPicker/SPPresentationConfiguration`` to build your setup:

```swift
func presentationConfiguration() -> SPPresentationConfiguration {
    SPPresentationConfiguration()
        .spPresentationBackgroundColor(.gray)
        .spPresentationContentInteraction(.resizes)
        .spPresentationDents([.fraction(0.3), .medium, .large])
        .spPresentationCornerRadius(25)
}
```
