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

Determines how the user can interact with the view behind a presentation.

## Overview

The `BackgroundInteraction` enum defines the behavior of the background content when a sheet or popover is presented. It corresponds to SwiftUI's `PresentationBackgroundInteraction` type, providing a platform-agnostic way to configure interaction.

Use this configuration to allow users to interact with the underlying view while a presentation is active, or to restrict interaction to the presentation itself. This is particularly useful for creating non-modal experiences, such as a floating tool palette or a contextual inspector, where the user might need to reference or manipulate the content behind the sheet.

## Topics

### Interaction Modes

- ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/automatic``
- ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/available(upThrough:)``
- ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/enabled``
- ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/disabled``
