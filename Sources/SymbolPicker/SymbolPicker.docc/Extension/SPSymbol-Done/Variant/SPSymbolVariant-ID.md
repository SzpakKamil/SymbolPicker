# ``SymbolPicker/SPSymbol/Variant/id``

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

A human-readable string representation of the symbol variant.

## Overview

The `id` property provides a capitalized string representation for each case of the variant enumeration. This is particularly useful when displaying the available variants in a user interface.

### UI Integration

Because this property returns a simple string, it can be easily integrated into SwiftUI controls such as:
- **Pickers**: Providing labels for each option in a dropdown or segmented control.
- **Labels**: Displaying the currently selected style in a settings or configuration view.
- **Accessibility**: Serving as a descriptive label for the variant itself.

### Case Mapping

- Returns `"Filled"` for the `.filled` case.
- Returns `"Outlined"` for the `.outlined` case.

### Technical Implementation

This property ensures that the enumeration remains identifiable and easily presentable to the user, bridging the gap between internal logic and the visual interface.
