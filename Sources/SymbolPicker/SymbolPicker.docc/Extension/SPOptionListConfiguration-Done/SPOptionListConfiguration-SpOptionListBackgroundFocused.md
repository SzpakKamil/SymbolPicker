# ``SymbolPicker/SPOptionListConfiguration/spOptionListBackgroundFocused(_:)``

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

Sets the background color for focused items.

- Parameter value: The background color.
- Returns: The updated configuration.

## Overview

The `spOptionListBackgroundFocused(_:)` method updates the ``SymbolPicker/SPOptionListConfiguration/optionListBackgroundFocused`` property. Use this to provide focus feedback when navigating with a keyboard or remote.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListBackgroundFocused(.gray.opacity(0.2))
```
