# ``SymbolPicker/SPPresentationConfiguration/presentationBackgroundColor``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

You define the color behind the symbol grid.

## Overview

The `presentationBackgroundColor` property sets the color for the picker's modal container. 

By default, the picker uses standard system backgrounds. You override this when you need a specific aesthetic, such as matching a dark-themed picker to a custom app brand.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationBackgroundColor(.secondarySystemGroupedBackground)
```
