# ``SymbolPicker/SPOptionListConfiguration/optionListInnerPaddingFactor``

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

A factor that determines the internal padding of list items, relative to their width.

## Overview

The `optionListInnerPaddingFactor` property controls the spacing between the content of an asset cell (symbol or emoji) and its background border. The final padding is calculated as `width * factor`.

### Usage in Code

```swift
let config = SPOptionListConfiguration()
    .spOptionListInnerPaddingFactor(0.2)
```
