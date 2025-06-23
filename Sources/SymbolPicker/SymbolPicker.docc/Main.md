# ``SymbolPicker``

Native, Customizable Symbol Picker

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @PageColor(orange)
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticTitleHeading(enabled)
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

## Overview

The `SymbolPicker` package offers a SwiftUI-based SF Symbol picker for iOS, iPadOS, macOS, and visionOS, enabling developers to create intuitive, customizable symbol selection experiences. As Apple’s SF Symbol picker is not available to developers, `SymbolPicker` rebuilds it from the ground up using SwiftUI components, providing a native-like interface for selecting from thousands of SF Symbols. Available as a standalone `SymbolPicker` view or a `.symbolPicker` modifier that dynamically adjusts presentation (popover on macOS, sheet on iOS and visionOS), it includes unit tests for reliability and supports accessibility features like VoiceOver and Dynamic Type. The package filters SF Symbols by comparing each symbol’s defined SF Symbols version with the system’s version (e.g., iOS 26 supports SF Symbols 7), ensuring only compatible symbols are displayed to avoid empty grid cells. For accessibility, each symbol includes a descriptive VoiceOver label, such as "Symbol of a car" instead of "car.fill," enhancing inclusivity.

@Image(source: "SymbolPicker-Tutorial-Banner.png", alt: "SymbolPicker app on iPhone, Mac, and visionOS with a sleek SF Symbol picker.")

Whether you’re adding symbol selection for user customization, annotations, or design purposes, `SymbolPicker` provides a flexible API with modifiers for symbol style and dismissal behavior. Its accessibility features ensure an inclusive experience, while its unit tests and extensive documentation make integration straightforward. Explore the resources below to start building with `SymbolPicker` and see how it can enhance user interactions in your app.

## Getting Started

@Links(visualStyle: detailedGrid) {
    - <doc:AboutSymbolPicker>
    - <doc:SetUp>
}

## Resources

@Links(visualStyle: detailedGrid) {
    - <doc:Modifiers>
}

## Sample Projects

@Links(visualStyle: detailedGrid) {
    - <doc:SymbolGallery>
}

## Topics

### Essentials
- <doc:AboutSymbolPicker>
- <doc:SetUp>
- <doc:Modifiers>
- <doc:SymbolPickerTutorial>

### Sample Projects
- <doc:SymbolGallery>

### Structures
- ``SymbolPicker/SymbolPicker``
- ``SymbolPicker/SymbolPickerData``

### Enums and Extensions
- ``SymbolPicker/SymbolPickerDismissType``
- ``SymbolPicker/SymbolPickerSymbolsStyle``
- ``SymbolPicker/SymbolColor``
- ``SwiftUICore/View``
