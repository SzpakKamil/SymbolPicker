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

Configures the spacing between various components in the picker.

## Overview

Use this modifier to fine-tune the layout by defining spacing for specific components using a builder closure.

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `content` | `() -> [SPSpacing]` | A builder closure providing the spacing configurations. |
