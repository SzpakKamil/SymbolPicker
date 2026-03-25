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

The primary data model representing a user's chosen asset within the `SymbolPicker` ecosystem.

## Overview

`SPSelection` is a generic struct that encapsulates the state of a selected item in the `SymbolPicker`. It is designed to be flexible, supporting multiple types of content including SF Symbols, Emojis, Custom Images, and pure Colors.

It conforms to ``SymbolPicker/SPSelectionProtocol``, ensuring a consistent interface for rendering and data access across the library. Most commonly, `SPSelection` is used with `SPSymbol` as its generic `DataAsset` type (i.e., `SPSelection<SPSymbol>`).

### Usage in SymbolPicker

`SPSelection` is the source of truth for the `SymbolPicker` view. When initializing a picker, you bind a selection object to it:

```swift
@State private var selection = SPSelection(systemName: "star.fill")

var body: some View {
    SymbolPicker(selection: $selection)
}
```

The picker updates this binding whenever a user selects a new item. The `SPSelection` struct handles the complexity of different item types (e.g., switching from a symbol to an emoji) internally, so your binding remains stable.

### Selection Types

The `SPSelection` struct can represent four distinct types of content, defined by the ``SymbolPicker/SPSelection/SelectionType`` enum:

- **Symbol**: An custom symbol (by default represented by `SPSymbol`).
- **Emoji**: A standard emoji character (represented by `SPEmoji`).
- **Image**: A custom image asset (represented by `SPImage`).
- **Color**: A solid color value (represented by `CKColor`).

### Protocol Conformance

`SPSelection` conforms to several key protocols to ensure it integrates seamlessly with SwiftUI and data persistence layers.

- `Identifiable`: Uses a stable ID based on the content type and value.
- `Codable`: Supports encoding and decoding for persistence (e.g., in `UserDefaults`).
- `Equatable`: Allows for efficient view updates.
- `Hashable`: Enables usage in sets and as dictionary keys.
- `Sendable`: Safe to pass across concurrency domains.

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
