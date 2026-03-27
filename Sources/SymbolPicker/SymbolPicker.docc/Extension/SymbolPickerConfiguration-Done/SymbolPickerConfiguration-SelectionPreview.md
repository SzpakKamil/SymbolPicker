# ``SymbolPicker/SymbolPickerConfiguration/selectionPreview``

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

Accesses the selection preview configuration.

## Overview

The `selectionPreview` property is a convenience shortcut for calling ``SymbolPicker/SymbolPickerConfiguration/selectionPreviewConfiguration()``.

### Implementation

It works as a simple wrapper:
```swift
var selectionPreview: SPSelectionPreviewConfiguration { selectionPreviewConfiguration() }
```

Use this property to quickly read or check the settings for the selection preview area, such as its corner radius or scaling behavior.
