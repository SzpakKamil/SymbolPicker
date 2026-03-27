# ``Swift/Sequence/getValue(_:for:at:)``

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
    @AutomaticArticleSubheading(disabled)
}

Returns the spacing value for a component and attribute at a specific type size.

- Parameters:
  - attribute: The spacing attribute, such as padding or margin.
  - component: The picker component.
  - typeSize: The current Dynamic Type size.
- Returns: The resolved spacing value or `0` if not found.

## Overview

This method searches the sequence for an ``SPSpacing`` element that matches the component. It then returns the numeric value for the attribute at the provided `DynamicTypeSize`.

### Example

```swift
let spacings: [SPSpacing] = configuration.spacing

let padding = spacings.getValue(
    .padding,
    for: .searchBar,
    at: dynamicTypeSize
)
```
