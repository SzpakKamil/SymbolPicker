# ``SymbolPicker/SPSelection``

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

The primary data model for user choices in SymbolPicker.

## Overview

The `SPSelection` struct is the main data model for user choices in the `SymbolPicker` ecosystem. This generic struct stores the state of a selected item, including SF Symbols, Emojis, Custom Images, and Colors.

### Usage in Library

`SPSelection` is the source of truth for the `SymbolPicker` view. When you initialize a picker, you bind a selection object to it. The picker updates this binding whenever a user selects a new item. `SPSelection` handles the transition between different asset types internally, keeping your binding stable.

### Content Types

The struct can represent four content types, defined by the ``SymbolPicker/SPSelection/SelectionType`` enum: symbols, emojis, images, and colors. It conforms to ``SymbolPicker/SPSelectionProtocol`` to provide a consistent interface for rendering and data access.

### System Integration

`SPSelection` conforms to several key protocols for SwiftUI and persistence. It is `Identifiable` for use in lists and `Codable` for storage in `UserDefaults` or databases. It also implements `Equatable`, `Hashable`, and `Sendable` to work efficiently in modern Swift applications.

## Topics

### Nested Types

- ``SymbolPicker/SPSelection/SelectionType``

### Initializers

- ``SymbolPicker/SPSelection/init(symbol:color:)``
- ``SymbolPicker/SPSelection/init(systemName:color:)``
- ``SymbolPicker/SPSelection/init(systemName:ckColor:)``
- ``SymbolPicker/SPSelection/init(systemName:colorValues:)``
- ``SymbolPicker/SPSelection/init(emoji:color:)``
- ``SymbolPicker/SPSelection/init(emoji:ckColor:)``
- ``SymbolPicker/SPSelection/init(emoji:colorValues:)``
- ``SymbolPicker/SPSelection/init(image:color:)``
- ``SymbolPicker/SPSelection/init(image:ckColor:)``
- ``SymbolPicker/SPSelection/init(image:colorValues:)``
- ``SymbolPicker/SPSelection/init(value:)``

### Instance Properties

- ``SymbolPicker/SPSelection/id``
- ``SymbolPicker/SPSelection/type``
- ``SymbolPicker/SPSelection/symbol``
- ``SymbolPicker/SPSelection/emoji``
- ``SymbolPicker/SPSelection/image``
- ``SymbolPicker/SPSelection/color``

### Instance Methods

- ``SymbolPicker/SPSelection/asView()``
- ``SymbolPicker/SPSelection/isContentAvailable()``
- ``SymbolPicker/SPSelection/setColor(_:)``
- ``SymbolPicker/SPSelection/setSymbol(_:)``
- ``SymbolPicker/SPSelection/setEmoji(_:)``
- ``SymbolPicker/SPSelection/setImage(_:)``
- ``SymbolPicker/SPSelection/getColor()``
- ``SymbolPicker/SPSelection/getSymbol()``
- ``SymbolPicker/SPSelection/getEmoji()``
- ``SymbolPicker/SPSelection/getImage()``
