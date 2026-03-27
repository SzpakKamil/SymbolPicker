# ``SymbolPicker/SPPresentationConfiguration/presentationContentInteraction``

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

You control how the picker reacts when you touch and drag its content.

## Overview

Use `presentationContentInteraction` to decide if dragging scrolls the symbol list or resizes the sheet. This property uses the ``SymbolPicker/SPPresentationConfiguration/ContentInteraction`` enum.

You need this control when your picker contains many symbols. Without it, a user trying to scroll down the grid might accidentally shrink the sheet. By setting this to `.scrolls`, you ensure the symbols stay interactive while the sheet remains stable.

### Default Value

The default value is `.automatic`.
