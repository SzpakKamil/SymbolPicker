# ``SymbolPicker/SPPageType``

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

An enumeration for browsing pages in SymbolPicker.

## Overview

The `SPPageType` enum sets the content categories users browse. It enables a tabbed interface for switching between different assets.

### Categories

- **Symbol**: SF Symbols or custom vector icons.
- **Emoji**: Standard emoji characters.
- **Image**: Custom photos (Availability depends on the OS).

### Usage

The library uses this enum to manage navigation:
- **SymbolPickerConfiguration**: Defines which pages appear in the picker.
- **SPPagePicker**: Renders the navigation bar so users can switch browsers.

### Availability

The enum checks the current platform and OS version to hide unsupported pages. This ensures the picker only shows features the device can render.

## Topics

### Page Types

- ``SymbolPicker/SPPageType/symbol``
- ``SymbolPicker/SPPageType/emoji``
- ``SymbolPicker/SPPageType/image``

### Instance Properties

- ``SymbolPicker/SPPageType/id``
- ``SymbolPicker/SPPageType/localizedDescription``
- ``SymbolPicker/SPPageType/systemName``

### Static Properties

- ``SymbolPicker/SPPageType/allCases``
