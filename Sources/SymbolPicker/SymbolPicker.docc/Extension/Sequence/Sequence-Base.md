# ``Swift/Sequence``

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

Extensions for sequences of spacing values.

## Overview

When you work with collections of ``SPSpacing``, use these methods to query specific measurements without searching the sequence manually. This extension applies to any sequence where the element is ``SPSpacing``. It provides type-safe access to component spacing that adapts to the user's Dynamic Type settings.

## Topics

### Retrieving Spacing Values
- ``Swift/Sequence/getValue(_:for:at:)``
