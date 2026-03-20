# ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/available(upThrough:)``

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

Allows background interaction up to a specific presentation detent.

## Overview

This case provides dynamic interaction control based on the sheet's current expansion state. When the sheet is at or below the specified `upThrough` detent, users can interact with the background content. If the sheet is expanded beyond that detent, background interaction is disabled.

### Use Case
This is ideal for creating "drawer" style interfaces:
- **Collapsed/Medium**: Acts as a floating tool panel or reference, allowing interaction with the main content.
- **Expanded/Large**: Transitions into a focused, modal task where the user's attention is entirely on the symbol library.

### Parameters
- `upThrough`: The largest ``SymbolPicker/SPPresentationConfiguration/PresentationDents`` at which background interaction is allowed. For example, setting this to `.medium` means interaction is enabled when the sheet is at `.medium` or smaller, but disabled when it expands to `.large`.
