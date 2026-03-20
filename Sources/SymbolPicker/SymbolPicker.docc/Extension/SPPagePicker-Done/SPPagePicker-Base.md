# ``SymbolPicker/SPPagePicker``

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
    @AutomaticArticleSubheading(disabled)
}

A segmented control or toggle for switching between different asset types (Symbols, Emojis, or Images).

## Overview

`SPPagePicker` is the primary top-level navigation component of the `SymbolPicker`. It enables users to toggle between broad data categories, such as switching from the SF Symbols library to the Emoji library.

### Adaptive Segment Management

The picker is fully driven by the `SymbolPickerStyle`. It automatically resolves its segments based on the `spAllowedPageTypes` environment property. 
- **Auto-Hiding**: If only one page type is allowed (e.g., only Symbols), the `SPPagePicker` automatically hides itself to maximize screen space.
- **Dynamic Content**: If the style specifies specific page types (through `supportedTypes`), the picker will prioritize and display those specific categories.

### Native Platform Experiences

The `SPPagePicker` transforms its appearance to align with each platform's design guidelines:
- **iOS/visionOS**: Renders as a standard SwiftUI `.segmented` Picker, utilizing appropriate padding and corner radii. On iOS 26+, it integrates with capsule-shaped glass containers.
- **watchOS**: To conserve screen real-estate, the picker presents as a simple toggle button with an icon and text label for the alternative page type.
- **macOS/tvOS**: Features specialized spacing and text alignment for improved readability and focus-based interaction.

### State Integration

The picker is bound directly to the `spPageType` environment property. When a user selects a new segment, the entire `SymbolPicker` context updates to load the corresponding asset category.

## Topics

### Initialization

- ``SymbolPicker/SPPagePicker/init()``
