# ``SymbolPicker/SymbolPicker/spSpacing(_:)``

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

Sets the spacing for picker components.

## Overview

Use this modifier to fine-tune the layout by defining spacing for specific components through a builder closure.

### Parameters

- **content**: A builder closure that returns spacing configurations.

### Usage

The closure uses `SPSpacing` objects to set gaps between elements like the search bar, asset grid, and color picker. This allows for precise layout control across different platforms.
