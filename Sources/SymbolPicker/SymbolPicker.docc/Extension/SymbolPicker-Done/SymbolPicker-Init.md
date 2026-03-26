# Initializers

Detailed reference for the available `SymbolPicker` initializers.

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

## Overview

`SymbolPicker` provides a wide range of specialized initializers to make binding to common data types as simple as possible. Whether you are managing a full ``SymbolPicker/SPSelection`` object or just a single `String` representing an SF Symbol name, there is an initializer tailored to your needs.

## Initializer Categories

### Base Generic Initializers
These initializers provide direct access to the underlying ``SymbolPicker/SPSelection`` object.

- ``SymbolPicker/SymbolPicker/init(selection:configuration:)``
- ``SymbolPicker/SymbolPicker/init(selection:configuration:)-261r7``

### SF Symbol Specialized Initializers
These initializers fix the asset type to ``SymbolPicker/SPSymbol`` and provide bindings to the symbol name and its associated color.

| Binding Type | Initializer |
| :--- | :--- |
| **String** | ``SymbolPicker/SymbolPicker/init(systemImage:configuration:)`` |
| **Optional String** | ``SymbolPicker/SymbolPicker/init(systemImage:configuration:)-6y664`` |
| **CKColor** | ``SymbolPicker/SymbolPicker/init(systemImage:ckColor:configuration:)`` |
| **Color** | ``SymbolPicker/SymbolPicker/init(systemImage:color:configuration:)`` |
| **[Double]** | ``SymbolPicker/SymbolPicker/init(systemImage:colorValues:configuration:)`` |

### Emoji Specialized Initializers
These initializers focus on ``SymbolPicker/SPEmoji`` selection and allow for color binding (useful when emojis are used as icons).

- ``SymbolPicker/SymbolPicker/init(emoji:configuration:)``
- ``SymbolPicker/SymbolPicker/init(emoji:configuration:)-3z664``
- ``SymbolPicker/SymbolPicker/init(emoji:ckColor:configuration:)``
- ``SymbolPicker/SymbolPicker/init(emoji:color:configuration:)``
- ``SymbolPicker/SymbolPicker/init(emoji:colorValues:configuration:)``

### Image Specialized Initializers
Used for selecting custom bitmapped images (``SymbolPicker/SPImage``).

- ``SymbolPicker/SymbolPicker/init(image:configuration:)``
- ``SymbolPicker/SymbolPicker/init(image:configuration:)-4z664``
- ``SymbolPicker/SymbolPicker/init(image:ckColor:configuration:)``
- ``SymbolPicker/SymbolPicker/init(image:color:configuration:)``
- ``SymbolPicker/SymbolPicker/init(image:colorValues:configuration:)``
