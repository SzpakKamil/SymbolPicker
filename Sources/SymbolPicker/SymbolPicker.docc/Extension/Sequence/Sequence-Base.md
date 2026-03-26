# ``Swift/Sequence``

Convenience methods on sequences of spacing values.

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

## Overview

When working with collections of ``SPSpacing`` values, this extension provides a direct way to query a specific spacing measurement without manually searching through the sequence.

The extension is constrained to sequences where `Element` is ``SPSpacing``, giving you type-safe access to component-specific spacing attributes that adapt to the current Dynamic Type size.

## Topics

### Retrieving Spacing Values
- ``Swift/Sequence/getValue(_:for:at:)``
