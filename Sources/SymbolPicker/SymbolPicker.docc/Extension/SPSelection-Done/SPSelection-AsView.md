# ``SymbolPicker/SPSelection/asView()``

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

Converts the selection into a SwiftUI view for rendering.

## Overview

Convert a selection into a SwiftUI view for rendering. The `asView()` method is the standard way to show an ``SymbolPicker/SPSelection`` in your UI. 

### Dynamic Rendering

The method returns an `AnyView` by switching between asset types. Symbols render via ``SymbolPicker/SPSymbolView``, while emojis use ``SymbolPicker/SPEmojiView``. Custom images use ``SymbolPicker/SPImageView``, and colors appear as circular fills.

### Thread Safety and Protocols

Because it creates UI components, this method requires the `@MainActor` attribute. It ensures view creation always occurs on the main thread. This method also fulfills the ``SymbolPicker/SPSelectionProtocol``, allowing uniform rendering across the entire library regardless of the underlying asset type.
