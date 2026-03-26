# ``Swift/Sequence/getValue(_:for:at:)``

Retrieves the spacing value for a given attribute and component at a specific Dynamic Type size.

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

## Overview

Searches the sequence for the first ``SPSpacing`` element matching the specified component, then returns the value associated with the given attribute at the provided Dynamic Type size. If no matching component is found, returns `0`.

### Parameters

| Name | Type | Description |
|---|---|---|
| `attribute` | ``SPSpacing/Attribute`` | The spacing attribute to retrieve (e.g., padding, margin). |
| `component` | ``SPSpacing/Component`` | The component whose spacing value is requested. |
| `typeSize` | `DynamicTypeSize` | The current Dynamic Type size used to resolve the appropriate spacing value. |

### Return Value

A `CGFloat` representing the resolved spacing value, or `0` if the component is not found in the sequence.

## Example Usage
```swift
let spacings: [SPSpacing] = configuration.spacing

let padding = spacings.getValue(
    .padding,
    for: .searchBar,
    at: dynamicTypeSize
)
```
