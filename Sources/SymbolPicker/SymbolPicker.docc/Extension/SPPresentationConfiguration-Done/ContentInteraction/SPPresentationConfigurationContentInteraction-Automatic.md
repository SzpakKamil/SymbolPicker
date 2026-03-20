# ``SymbolPicker/SPPresentationConfiguration/ContentInteraction/automatic``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.4")
    @Available(iPadOS, introduced: "16.4")
    @Available(macOS, introduced: "13.3")
    @Available(tvOS, introduced: "16.4")
    @Available(watchOS, introduced: "9.4")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.7")
    @Available(Xcode, introduced: "14.3")
    @DocumentationExtension(mergeBehavior: override)
}

The system's default content interaction behavior.

## Overview

When set to `.automatic`, the platform intelligently decides whether to resize or scroll based on the content hierarchy and context. This is generally the safest option for standard list-based views, as it preserves the native behavior that users expect (e.g., pulling down to dismiss or scrolling content naturally).

### Use Case
Use this mode unless you encounter specific gesture conflicts or require specialized layout behavior during presentation resizing.
