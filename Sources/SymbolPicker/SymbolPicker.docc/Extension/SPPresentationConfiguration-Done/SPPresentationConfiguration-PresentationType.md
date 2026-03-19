# ``SymbolPicker/SPPresentationConfiguration/presentationType``

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

The type of modal presentation used for the SymbolPicker.

## Overview

The `presentationType` property controls the overall container style of the picker when it is presented. It supports standard modal presentations like sheets and popovers.

### Values

- **default**: Uses the platform's default presentation (usually a sheet on iOS and a popover on iPad/Mac).
- **popover**: Explicitly requests a popover presentation.
- **sheet**: Explicitly requests a standard sheet presentation.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationType(.popover)
```
