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

Enable background interaction up to a specific presentation detent.

## Overview

You control when users can reach the content behind the picker. This case ties interaction availability to the sheet's expansion state. Users interact with background elements while the picker remains at or below your chosen `upThrough` detent. If the picker grows beyond that point, the system blocks background interaction to focus the user on their selection.

### Drawer Interfaces
Use this setting to build drawer interfaces. 

When you set the limit to `.medium`, users can still tap buttons or scroll lists in your main view while the picker sits at the bottom of the screen. As soon as the user pulls the picker up to the `.large` detent, the background dims or becomes unresponsive. This transition signals a shift from quick browsing to a dedicated selection task.

### Parameters
- `upThrough`: The largest ``SymbolPicker/SPPresentationConfiguration/PresentationDents`` that allows background interaction. If you choose `.medium`, interaction works at the medium height and any smaller custom heights. It stops working at any height larger than medium.
