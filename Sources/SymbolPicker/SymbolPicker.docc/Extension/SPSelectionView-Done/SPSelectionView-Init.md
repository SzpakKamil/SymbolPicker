# ``SymbolPicker/SPSelectionView/init(selection:)``

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

Initializes a selection view with a model.

## Overview

The `init(selection:)` initializer builds a dynamic component that renders the asset matching your selection.

### Parameters

- **`selection`**: An optional ``SymbolPicker/SPSelection`` object. If `nil`, the view remains empty.

### Process

The view stores the optional model. The system resolves the asset type and maps it to the correct rendering view during the layout phase.
