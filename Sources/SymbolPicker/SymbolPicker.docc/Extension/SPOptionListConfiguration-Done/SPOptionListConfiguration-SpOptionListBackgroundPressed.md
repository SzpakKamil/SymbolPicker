# ``SymbolPicker/SPOptionListConfiguration/spOptionListBackgroundPressed(_:)``

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

Sets the background color for pressed items.

- Parameter value: The background color.
- Returns: The updated configuration.

## Overview

The `spOptionListBackgroundPressed(_:)` method updates the ``SymbolPicker/SPOptionListConfiguration/optionListBackgroundPressed`` property. Use this to provide visual feedback during touch or click interactions.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListBackgroundPressed(.gray.opacity(0.3))
```
