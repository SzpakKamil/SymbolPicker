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
    @PageColor(blue)
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticTitleHeading(enabled)
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

## Overview

SymbolPicker is a SwiftUI-based SF Symbol picker for iOS, iPadOS, macOS, and visionOS, offering customizable symbol selection. Built from scratch, it mimics Apple’s native interface, available as a SymbolPicker view or .symbolPicker modifier (popover on macOS, sheet on iOS/visionOS). It includes unit tests, supports VoiceOver and Dynamic Type, and filters symbols by system compatibility (e.g., iOS 26 supports SF Symbols 7). Descriptive VoiceOver labels (e.g., "Symbol of a car" instead of "car.fill") enhance accessibility.

@Image(source: "SymbolPicker-Banner.png", alt: "SymbolPicker app on iPhone, Mac, and visionOS with a sleek SF Symbol picker.")

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
- <doc:SymbolPickerDynamicTypeSize>

### Sample Projects
- <doc:SymbolGallery>

### Structures
- ``SymbolPicker/SymbolPicker``

### Enums and Extensions
- ``SymbolPicker/SymbolPickerDismissType``
- ``SymbolPicker/SymbolPickerSymbolsStyle``
- ``SymbolPicker/SymbolColor``
- ``SwiftUICore/View``
