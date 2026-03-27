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

You use this button to close the picker on any platform.

## Overview

`SPDismissButton` provides a consistent way to close the interface. It handles system icons, localization, and dismissal logic automatically.

### Adaptive Visual Style

The button optimizes its look for the device:
- **iOS 26+**: You see a modern glass circle button.
- **Legacy iOS**: You get a standard `xmark.circle.fill` icon with high-contrast colors.
- **macOS/watchOS**: You see the localized system "Close" button.

### Automated Localization

The button translates its title and accessibility labels using the `SPTranslation.Close` key. This ensures your users understand the button in any supported language.

### Integration and Action

The button connects to the SwiftUI `dismiss` action. Tapping it closes the current sheet, popover, or full-screen cover instantly.

```swift
SPDismissButton()
```

## Topics

### Initialization

- ``SymbolPicker/SPDismissButton/init()``
