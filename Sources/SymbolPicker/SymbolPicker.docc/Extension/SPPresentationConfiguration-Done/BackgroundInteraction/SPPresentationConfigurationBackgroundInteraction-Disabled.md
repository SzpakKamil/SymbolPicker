# ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/disabled``

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
    @DocumentationExtension(mergeBehavior: override)
}

Prevent interaction with views behind the presentation.

## Overview

The system blocks all touches and clicks on the background view when you set interaction to `.disabled`. This creates a modal state. Users cannot interact with the underlying content while the picker remains on screen. A dimming overlay often appears to signal this focus shift.

### User Focus
You direct the user's attention solely to the symbol library. This works best when selecting a symbol is a primary task that requires a full stop. If the user taps the dimmed area, the picker dismisses. You ensure the user finishes their selection or explicitly cancels before they return to the main application flow.

### Implementation
Use this mode for standard sheet presentations where the picker covers most of the content. It simplifies the user experience by removing distractions. It also prevents accidental taps on buttons or links hidden behind the picker's frame.
