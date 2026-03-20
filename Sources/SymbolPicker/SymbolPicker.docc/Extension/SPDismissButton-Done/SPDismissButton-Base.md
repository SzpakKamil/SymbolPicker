# ``SymbolPicker/SPDismissButton``

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

A standardized, platform-adaptive button for dismissing the `SymbolPicker` interface.

## Overview

`SPDismissButton` provides a consistent way to close the picker. It automatically resolves the appropriate system icon, localization, and dismissal action based on the host platform and operating system version.

### Adaptive Visual Style

The button's appearance is automatically optimized:
- **iOS 26+**: Renders as a modern glass button with a circular border using the `.glass` button style.
- **Legacy iOS**: Falls back to the system's `xmark.circle.fill` icon with a hierarchical rendering mode for improved contrast.
- **macOS/watchOS**: Standardizes on the appropriate system-provided button title ("Close" or localized equivalent).

### Automated Localization

The button's title and accessibility labels are automatically localized using the `SPTranslation.Close` key, ensuring that the button is accessible and understandable to users in all supported languages.

### Integration and Action

The button is integrated with the SwiftUI `dismiss` environment action. When tapped, it triggers the dismissal of the current presentation context (e.g., sheet, full-screen cover, or popover).

```swift
SPDismissButton()
```

## Topics

### Initialization

- ``SymbolPicker/SPDismissButton/init()``
