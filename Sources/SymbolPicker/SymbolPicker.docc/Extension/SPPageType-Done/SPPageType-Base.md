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

An enumeration representing the different browsing pages available in a `SymbolPicker`.

## Overview

The `SPPageType` enum defines the content categories that a user can browse within the picker. It allows for a tabbed interface where users can switch between different types of assets.

### Page Categories

- **Symbol**: Browsing SF Symbols or custom vector icons.
- **Emoji**: Browsing standard system emoji characters.
- **Image**: Browsing custom bitmapped images (Availability depends on platform and OS version).

### Library Integration

The `SPPageType` enum is used across the library to manage content navigation and configuration:
- **SymbolPickerConfiguration**: Developers use `SPPageType` to define which pages should be visible in the picker, allowing for custom configurations that only show symbols, emojis, or specific combinations.
- **SPPagePicker**: This component uses the enum cases to render the actual navigation bar ensuring users can switch between different asset browsers seamlessly.

### Dynamic Availability

The `SPPageType` enum includes logic to determine which pages are available based on the current platform and OS version. This ensures that the picker only offers features supported by the host device.

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
