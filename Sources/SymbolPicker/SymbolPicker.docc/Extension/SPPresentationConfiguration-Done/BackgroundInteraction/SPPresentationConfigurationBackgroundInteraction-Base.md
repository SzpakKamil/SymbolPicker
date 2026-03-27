# ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction``

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

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Control user interaction with the view behind a presentation.

## Overview

The `BackgroundInteraction` enum governs how users reach the background when the picker appears. It mirrors SwiftUI's `PresentationBackgroundInteraction` while remaining platform-agnostic. 

You choose whether the picker blocks interaction or allows it. This choice transforms the user experience. A blocking interaction creates a focused selection task. Allowing interaction turns the picker into a tool palette. Users can scroll the main view, tap buttons, and edit content while the symbol library stays open for reference.

### Non-modal Interfaces
Use these settings for inspectors and tool panels. 

When you allow background interaction, you create a seamless flow between the main content and the picker. The picker acts as a companion. This helps when the user needs to try different symbols quickly to see how they look in context.

## Topics

### Interaction Modes

- ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/automatic``
- ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/available(upThrough:)``
- ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/enabled``
- ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/disabled``
