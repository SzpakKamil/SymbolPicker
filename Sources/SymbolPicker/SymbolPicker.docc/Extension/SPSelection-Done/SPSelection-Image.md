# ``SymbolPicker/SPSelection/image``

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

The custom image asset for the selection.

## Overview

The `image` property holds the custom asset for a selection. This property is active when the selection `type` is `.image`. 

### Data Access

Because this property is `private(set)`, you must use ``SymbolPicker/SPSelection/setImage(_:)`` to update it. This method ensures the selection type matches the asset and triggers any necessary UI updates.

### Persistence

The library encodes the image's unique identifier or data to the `image` key during persistence. This allows for consistent restoration between application sessions, ensuring users don't lose their custom selections.
