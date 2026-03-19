# ``SymbolPicker/SymbolPickerConfiguration/presentationConfiguration()``

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


Returns an ``SymbolPicker/SPPresentationConfiguration`` object that controls how the picker is presented.

- Returns: A configuration object for modal presentation behaviors.

## Overview

The `presentationConfiguration()` method is responsible for defining the "shell" of the picker. It governs the presentation type (e.g., sheet or popover), the background color of the modal, corner radii, and drag interaction behaviors.

### Customization

When implementing this method in a custom ``SymbolPicker/SymbolPickerConfiguration``, you can use the fluent API provided by ``SymbolPicker/SPPresentationConfiguration`` to build a custom setup:

```swift
func presentationConfiguration() -> SPPresentationConfiguration {
    SPPresentationConfiguration()
        .spPresentationBackgroundColor(.gray)
        .spPresentationContentInteraction(.resizes)
        .spPresentationDents([.fraction(0.3), .medium, .large])
        .spPresentationCornerRadius(25)
}
```
